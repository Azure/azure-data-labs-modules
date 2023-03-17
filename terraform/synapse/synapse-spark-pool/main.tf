# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_spark_pool

resource "azurerm_synapse_spark_pool" "syn_synsp" {
  name                 = "synsp${var.basename}"
  synapse_workspace_id = var.synapse_workspace_id
  node_size_family     = var.node_size_family
  node_size            = var.node_size
  cache_size           = var.cache_size
  spark_version        = var.spark_version


  auto_scale {
    max_node_count = 50
    min_node_count = 3
  }
  auto_pause {
    delay_in_minutes = 15
  }

  count = var.module_enabled ? 1 : 0
}