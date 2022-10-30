# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster

locals {

  default_node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  merged_default_node_pool = merge(local.default_node_pool, var.default_node_pool)

}

resource "azurerm_kubernetes_cluster" "adl_aks" {

  name                = "aks-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = local.default_node_pool.name
    node_count = local.default_node_pool.node_count
    vm_size    = local.default_node_pool.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

