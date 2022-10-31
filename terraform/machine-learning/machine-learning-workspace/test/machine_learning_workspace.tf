module "machine_learning_workspace" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/machine-learning/machine-learning-workspace"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [
    data.azurerm_private_dns_zone.mlw_api.id,
    data.azurerm_private_dns_zone.mlw_notebooks.id
  ]

  storage_account_id      = module.local_storage_account.id
  key_vault_id            = module.local_key_vault.id
  application_insights_id = module.local_application_insights.id
  container_registry_id   = module.local_container_registry.id

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "mlw_api" {
  name                = local.dns_mlw_api
  resource_group_name = var.rg_name_dns
}

data "azurerm_private_dns_zone" "mlw_notebooks" {
  name                = local.dns_mlw_notebooks
  resource_group_name = var.rg_name_dns
}

# Module dependencies

module "local_storage_account" {
  source = "../../../storage-account/test"
}

module "local_key_vault" {
  source = "../../../key-vault/test"
}

module "local_application_insights" {
  source = "../../../application-insights/test"
}

module "local_container_registry" {
  source = "../../../container-registry/test"
}