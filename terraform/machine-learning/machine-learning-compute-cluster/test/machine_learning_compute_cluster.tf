module "machine_learning_compute_cluster" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/machine-learning/machine-learning-compute-cluster"

  location = var.location

  subnet_id                     = data.azurerm_subnet.snet_compute.id
  machine_learning_workspace_id = data.azurerm_machine_learning_workspace.mlw_default.id

  module_enabled = true
}

# Data dependencies

data "azurerm_subnet" "snet_compute" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_machine_learning_workspace" "mlw_default" {
  name                = local.mlw_name
  resource_group_name = var.rg_name
}

# Module dependencies