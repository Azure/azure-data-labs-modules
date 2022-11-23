module "synapse_spark_pool" {
  source = "../"

  basename             = random_string.postfix.result
  synapse_workspace_id = module.local_synapse_workspace.id

  module_enabled = true
}

# Module dependencies

module "local_rg" {
  source = "../../../resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = local.tags
}

module "local_synapse_workspace" {
  source = "../../synapse-workspace"

  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location

  adls_id              = module.local_storage_account.adls_id
  storage_account_id   = module.local_storage_account.id
  storage_account_name = module.local_storage_account.name

  synadmin_username = var.synadmin_username
  synadmin_password = var.synadmin_password

  aad_login = {
    name      = var.aad_login.name
    object_id = var.aad_login.object_id
    tenant_id = var.aad_login.tenant_id
  }

  is_sec_module  = false
  module_enabled = true

  tags = {}
}

# Storage Account

module "local_storage_account" {
  source = "../../../storage-account"

  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location

  hns_enabled             = true
  firewall_default_action = "Allow"

  is_sec_module  = false
  module_enabled = true
}