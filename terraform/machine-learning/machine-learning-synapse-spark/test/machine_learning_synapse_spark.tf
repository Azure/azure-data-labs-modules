module "machine_learning_synapse_spark" {
  source = "../"

  basename = random_string.postfix.result
  location = var.location

  machine_learning_workspace_id = data.azurerm_machine_learning_workspace.mlw_default.id
  synapse_spark_pool_id         = module.local_synapse_spark_pool.id
}

# Data dependencies

data "azurerm_machine_learning_workspace" "mlw_default" {
  name                = local.mlw_name
  resource_group_name = var.rg_name
}

# Module dependencies

module "local_synapse_spark_pool" {
  source = "../../../synapse/synapse-spark-pool/test"
}