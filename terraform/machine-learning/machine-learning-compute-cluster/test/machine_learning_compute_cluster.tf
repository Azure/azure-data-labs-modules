module "machine_learning_compute_cluster" {
  source                        = "../"
  basename                      = random_string.postfix.result
  location                      = var.location
  subnet_id                     = module.local_snet_default.id
  machine_learning_workspace_id = module.local_mlw.id
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
  name                = "vnet-${random_string.postfix.result}-mlw-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_storage_account" {
  source                  = "../../../storage-account"
  basename                = random_string.postfix.result
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