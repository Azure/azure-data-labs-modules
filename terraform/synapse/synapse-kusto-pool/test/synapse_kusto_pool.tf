module "synapse_kusto_pool" {
  source = "../"

  basename              = random_string.postfix.result
  location              = var.location
  synapse_workspace_id  = module.local_synapse_workspace.id
  synapse_workspace_uid = "dfeaa36c-1b3e-4b05-9cf3-962a097aef3c"
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

  set_aad_login = false
  is_sec_module = false

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

  is_sec_module = false
}