module "synapse_workspace" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id                = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids_sql = [data.azurerm_private_dns_zone.syn_sql.id]
  private_dns_zone_ids_dev = [data.azurerm_private_dns_zone.syn_dev.id]

  adls_id = module.local_storage_account.adls_id

  storage_account_id   = module.local_storage_account.id
  storage_account_name = module.local_storage_account.name

  key_vault_id   = module.local_key_vault.id
  key_vault_name = module.local_key_vault.name

  synadmin_username = var.synadmin_username
  synadmin_password = var.synadmin_password

  aad_login = {
    name      = var.aad_login.name
    object_id = var.aad_login.object_id
    tenant_id = var.aad_login.tenant_id
  }

  module_enabled = true

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "syn_sql" {
  name                = local.dns_syn_sql
  resource_group_name = var.rg_name_dns
}

data "azurerm_private_dns_zone" "syn_dev" {
  name                = local.dns_syn_dev
  resource_group_name = var.rg_name_dns
}

# Module dependencies

module "local_storage_account" {
  source = "../../../storage-account/test"
}

module "local_key_vault" {
  source = "../../../key-vault/test"
}