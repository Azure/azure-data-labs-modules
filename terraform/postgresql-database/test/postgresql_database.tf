module "postgresql_database" {
  source              = "../"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  subnet_id           = module.local_snet_psql.id
  private_dns_zone_id = module.local_pdnsz_psql.list[local.dns_psql_server].id
  identity_ids        = [module.local_uami.id]
  customer_managed_key = {
    "cmk" = {
      key_vault_key_id                  = azurerm_key_vault_key.key.id
      primary_user_assigned_identity_id = module.local_uami.id
    }
  }
  tags       = {}
  depends_on = [module.local_pdnsz_psql, time_sleep.wait_30_seconds]
}

# Latency to avoid serviceAssociationLinks element to prevent destroy.
resource "time_sleep" "wait_30_seconds" {
  depends_on = [module.local_snet_psql]

  destroy_duration = "30s"
}

# Modules dependencies

data "http" "ip" {
  url = "https://ifconfig.me"
}

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source              = "../../virtual-network"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_psql" {
  source              = "../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-psql-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
  service_endpoints   = ["Microsoft.Storage"]
  subnet_delegation = {
    postgresql-del = [
      {
        name = "Microsoft.DBforPostgreSQL/flexibleServers"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action"
        ]
      }
    ]
  }
}

module "local_pdnsz_psql" {
  source              = "../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_psql_server]
  vnet_id             = module.local_vnet.id
}

module "local_uami" {
  source              = "../../user-assigned-identity"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
}

module "local_akv" {
  source                        = "../../key-vault"
  resource_group_name           = module.local_rg.name
  basename                      = random_string.postfix.result
  location                      = var.location
  is_private_endpoint           = false
  public_network_access_enabled = true
  sku_name                      = "standard"
  firewall_default_action       = "Allow"
  firewall_ip_rules             = ["${data.http.ip.response_body}/32"]
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "akv_access_policy_terraform_principal" {
  tenant_id    = data.azurerm_client_config.current.tenant_id
  key_vault_id = module.local_akv.id
  object_id    = data.azurerm_client_config.current.object_id
  key_permissions = [
    "Create",
    "Get",
    "Delete",
    "Recover",
    "GetRotationPolicy"
  ]
}

resource "azurerm_key_vault_access_policy" "akv_access_policy_postgresql_principal" {
  tenant_id    = data.azurerm_client_config.current.tenant_id
  key_vault_id = module.local_akv.id
  object_id    = module.local_uami.principal_id
  key_permissions = [
    "Get",
    "WrapKey",
    "UnwrapKey"
  ]
}

resource "azurerm_key_vault_key" "key" {
  name         = "pgsql-key"
  key_vault_id = module.local_akv.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
  depends_on = [azurerm_key_vault_access_policy.akv_access_policy_terraform_principal]
}