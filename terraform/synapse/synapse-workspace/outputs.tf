output "id" {
  value = (
    length(azurerm_synapse_workspace.adl_syn) > 0 ?
    azurerm_synapse_workspace.adl_syn[0].id : ""
  )
  description = "Resource identifier of the instance of Synapse workspace."
}

output "name" {
  value = (
    length(azurerm_synapse_workspace.adl_syn) > 0 ?
    azurerm_synapse_workspace.adl_syn[0].name : ""
  )
  description = "The name of the Synapse workspace."
}

output "resource_group_name" {
  value = (
    length(azurerm_synapse_workspace.adl_syn) > 0 ?
    azurerm_synapse_workspace.adl_syn[0].resource_group_name : ""
  )
  description = "Resource Group where the Synapse workspace exists."
}