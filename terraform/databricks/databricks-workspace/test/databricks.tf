module "databricks" {
  source                                               = "../"
  basename                                             = random_string.postfix.result
  resource_group_name                                  = module.local_rg.name
  location                                             = var.location
  virtual_network_id                                   = module.local_vnet.id
  storage_account_name                                 = "st${random_string.postfix.result}"
  storage_account_sku_name                             = "Standard_LRS"
  infrastructure_encryption_enabled                    = true
  customer_managed_key_enabled                         = true
  managed_services_cmk_key_vault_key_id                = azurerm_key_vault_key.adl_adb_ws_cmk.id
  managed_disk_cmk_key_vault_key_id                    = azurerm_key_vault_key.adl_adb_ws_cmk.id
  managed_disk_cmk_rotation_to_latest_version_enabled  = false
  is_private_endpoint                                  = true
  private_link_deployment_type                         = "simplified"
  is_web_auth_workspace                                = true
  backend_subnet_id                                    = module.local_snet_default.id
  backend_private_dns_zone_ids                         = [module.local_pdnsz_adb.list[local.dns_databricks].id]
  backend_dbfs_private_dns_zone_ids                    = [module.local_pdnsz_dbfs.list[local.dns_dbfs_dfs].id]
  public_subnet_name                                   = module.local_snet_public.name
  private_subnet_name                                  = module.local_snet_private.name
  public_subnet_network_security_group_association_id  = module.local_snet_nsg_association_public.id
  private_subnet_network_security_group_association_id = module.local_snet_nsg_association_private.id
  public_network_access_enabled                        = false
  tags                                                 = {}
}

resource "time_sleep" "time_sleep" {
  depends_on = [
    module.databricks
  ]
  create_duration = "40s"
}

resource "azurerm_databricks_workspace_root_dbfs_customer_managed_key" "adl_adb_ws_cmk" {
  depends_on = [
    azurerm_key_vault_access_policy.databricks,
    time_sleep.time_sleep
  ]

  workspace_id     = module.databricks.id
  key_vault_key_id = azurerm_key_vault_key.adl_adb_ws_cmk.id
}

# Modules dependencies

data "http" "ip" {
  url = "https://ifconfig.me"
}

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source              = "../../../virtual-network"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source              = "../../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-adb-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_snet_public" {
  source              = "../../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-adb-public"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.4.0/24"]
  subnet_delegation = {
    databricks-del-pub = [
      {
        name = "Microsoft.Databricks/workspaces"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
      }
    ]
  }
}

module "local_snet_private" {
  source              = "../../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-adb-private"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.5.0/24"]
  subnet_delegation = {
    databricks-del-pri = [
      {
        name = "Microsoft.Databricks/workspaces"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
      }
    ]
  }
}

module "local_nsg" {
  source              = "../../../network-security-group"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
}

module "local_snet_nsg_association_public" {
  source                    = "../../../subnet-network-security-group-association"
  subnet_id                 = module.local_snet_public.id
  network_security_group_id = module.local_nsg.id
}

module "local_snet_nsg_association_private" {
  source                    = "../../../subnet-network-security-group-association"
  subnet_id                 = module.local_snet_private.id
  network_security_group_id = module.local_nsg.id
}

module "local_pdnsz_adb" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_databricks]
  vnet_id             = module.local_vnet.id
}

module "local_pdnsz_dbfs" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_dbfs_dfs]
  vnet_id             = module.local_vnet.id
}

module "local_pdnsz_kv" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_key_vault]
  vnet_id             = module.local_vnet.id
}

# Key Vault

module "key_vault" {
  source                        = "../../../key-vault"
  basename                      = random_string.postfix.result
  resource_group_name           = module.local_rg.name
  location                      = var.location
  subnet_id                     = module.local_snet_default.id
  private_dns_zone_ids          = [module.local_pdnsz_kv.list[local.dns_key_vault].id]
  sku_name                      = "premium"
  public_network_access_enabled = true
  is_private_endpoint           = false
  firewall_default_action       = "Allow"
  firewall_ip_rules             = ["${data.http.ip.response_body}/32"]
  tags                          = {}
}

resource "azurerm_key_vault_key" "adl_adb_ws_cmk" {
  depends_on = [
    azurerm_key_vault_access_policy.terraform,
    azurerm_key_vault_access_policy.managed_services
  ]

  name         = "databricks-cmk-certificate"
  key_vault_id = module.key_vault.id
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
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "terraform" {
  key_vault_id = module.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Create",
    "Delete",
    "Get",
    "Purge",
    "Recover",
    "Update",
    "List",
    "Decrypt",
    "Sign",
    "GetRotationPolicy",
  ]
}

resource "azurerm_key_vault_access_policy" "databricks" {

  key_vault_id = module.key_vault.id
  tenant_id    = module.databricks.storage_account_identity.0.tenant_id
  object_id    = module.databricks.storage_account_identity.0.principal_id

  key_permissions = [
    "Get",
    "UnwrapKey",
    "WrapKey",
  ]
}

resource "azurerm_key_vault_access_policy" "managed_disks" {

  key_vault_id = module.key_vault.id
  tenant_id    = module.databricks.managed_disk_identity.0.tenant_id
  object_id    = module.databricks.managed_disk_identity.0.principal_id

  key_permissions = [
    "Get",
    "UnwrapKey",
    "WrapKey",
  ]
}

# AzureDatabricks application which retrieves the keys for managed services encryption
#data "azuread_application" "azuredatabricks" {
#  application_id = "2ff814a6-3304-4ab8-85cb-cd0e6f879c1d"
#}

resource "azurerm_key_vault_access_policy" "managed_services" {
  key_vault_id = module.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "446abf6e-a8d1-49fe-9df7-a8a429c98c41" #data.azuread_application.azuredatabricks.object_id

  key_permissions = [
    "Get",
    "UnwrapKey",
    "WrapKey",
  ]
}