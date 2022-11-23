module "machine_learning_inference_cluster" {
  source = "../"

  basename = random_string.postfix.result
  location = var.location

  machine_learning_workspace_id = data.azurerm_machine_learning_workspace.mlw_default.id
  kubernetes_cluster_id         = module.local_aks.id
}

# Data dependencies

data "azurerm_subnet" "snet_aks" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_machine_learning_workspace" "mlw_default" {
  name                = local.mlw_name
  resource_group_name = var.rg_name
}

# Module dependencies

module "local_aks" {
  source = "../../../aks-cluster/test"
}