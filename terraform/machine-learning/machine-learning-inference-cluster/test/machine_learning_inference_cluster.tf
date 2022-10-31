module "machine_learning_inference_cluster" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/machine-learning/machine-learning-inference-cluster"

  basename = random_string.postfix.result
  location = var.location

  machine_learning_workspace_id = data.azurerm_machine_learning_workspace.mlw_default.id
  kubernetes_cluster_id         = azurerm_kubernetes_cluster.adl_aks.id

  module_enabled = true
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

resource "azurerm_kubernetes_cluster" "adl_aks" {
  name                = "aks-adl-modules-test"
  location            = var.location
  resource_group_name = var.rg_name
  #dns_prefix_private_cluster = "adlaks1"
  dns_prefix = "adlaks1"

  default_node_pool {
    name           = "default"
    node_count     = 3
    vm_size        = "Standard_D3_v2"
    vnet_subnet_id = data.azurerm_subnet.snet_aks.id
  }

  identity {
    type = "SystemAssigned"
  }

  # network_profile {
  #   network_plugin     = "azure"
  #   dns_service_ip     = "10.0.3.10"
  #   service_cidr       = "10.0.3.0/24"
  #   docker_bridge_cidr = "172.17.0.1/16"
  # }
}