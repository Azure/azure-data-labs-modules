module "machine_learning_inference_cluster" {
  source                        = "../"
  basename                      = random_string.postfix.result
  location                      = var.location
  machine_learning_workspace_id = module.local_mlw.id
  kubernetes_cluster_id         = module.local_aks.id
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

module "local_aks" {
  source              = "../../../aks-cluster"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  dns_prefix          = "azdatalbsaks"
  default_node_pool = {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }
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