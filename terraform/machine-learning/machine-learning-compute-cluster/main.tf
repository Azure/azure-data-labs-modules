# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_compute_cluster

resource "azurerm_machine_learning_compute_cluster" "adl_mlw_compute_cluster" {
  name                          = "mlwcc${var.basename}"
  location                      = var.location
  vm_priority                   = var.vm_priority
  vm_size                       = var.vm_size
  machine_learning_workspace_id = var.machine_learning_workspace_id
  subnet_resource_id            = var.subnet_id
  scale_settings {
    min_node_count                       = 0
    max_node_count                       = 1
    scale_down_nodes_after_idle_duration = "PT30S" # 30 seconds
  }
  identity {
    type = "SystemAssigned"
  }

  count = var.module_enabled ? 1 : 0
}