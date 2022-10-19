# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_synapse_spark

locals {
  safe_basename = replace(var.basename, "-", "")
}

resource "azurerm_machine_learning_synapse_spark" "adl_mlw_synapse_spark" {
  name                          = "mlwss${local.safe_basename}"
  machine_learning_workspace_id = var.machine_learning_workspace_id
  location                      = var.location
  synapse_spark_pool_id         = var.synapse_spark_pool_id

  identity {
    type = "SystemAssigned"
  }

  count = var.module_enabled ? 1 : 0
}