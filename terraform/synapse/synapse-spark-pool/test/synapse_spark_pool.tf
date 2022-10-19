module "synapse_spark_pool" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/synapse/synapse-spark-pool"

  basename             = random_string.postfix.result
  synapse_workspace_id = data.azurerm_synapse_workspace.syn_default.id

  module_enabled = true
}

# Data dependencies

data "azurerm_synapse_workspace" "syn_default" {
  name                = local.syn_name
  resource_group_name = var.rg_name
}