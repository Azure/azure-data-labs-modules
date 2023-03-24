module "machine_learning_synapse_spark" {
  source                        = "../"
  basename                      = random_string.postfix.result
  location                      = var.location
  machine_learning_workspace_id = module.local_mlw.id
  synapse_spark_pool_id         = module.local_synapse_spark_pool.id
}

# Modules dependencies

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_mlw" {
  source                  = "../../machine-learning-workspace"
  basename                = random_string.postfix.result
  resource_group_name     = module.local_rg.name
  location                = var.location
  storage_account_id      = module.local_storage_account.id
  key_vault_id            = module.local_key_vault.id
  application_insights_id = module.local_application_insights.id
  container_registry_id   = module.local_container_registry.id
  is_private_endpoint     = false
}

module "local_storage_account" {
  source                  = "../../../storage-account"
  basename                = "${random_string.postfix.result}aml"
  resource_group_name     = module.local_rg.name
  location                = var.location
  hns_enabled             = false
  firewall_default_action = "Allow"
  is_private_endpoint     = false
}

module "local_key_vault" {
  source              = "../../../key-vault"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  is_private_endpoint = false
}

module "local_application_insights" {
  source              = "../../../application-insights"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
}

module "local_container_registry" {
  source              = "../../../container-registry"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  is_private_endpoint = false
}

module "local_synapse_workspace" {
  source               = "../../../synapse/synapse-workspace"
  basename             = random_string.postfix.result
  resource_group_name  = module.local_rg.name
  location             = var.location
  adls_id              = module.local_storage_account_syn.adls_id
  storage_account_id   = module.local_storage_account_syn.id
  storage_account_name = module.local_storage_account_syn.name
  synadmin_username    = var.synadmin_username
  synadmin_password    = var.synadmin_password
  set_aad_login        = false
  is_private_endpoint  = false
  tags                 = {}
}

module "local_synapse_spark_pool" {
  source               = "../../../synapse/synapse-spark-pool"
  basename             = random_string.postfix.result
  synapse_workspace_id = module.local_synapse_workspace.id
}

module "local_storage_account_syn" {
  source                  = "../../../storage-account"
  basename                = "${random_string.postfix.result}syn"
  resource_group_name     = module.local_rg.name
  location                = var.location
  hns_enabled             = true
  firewall_default_action = "Allow"
  is_private_endpoint     = false
}
