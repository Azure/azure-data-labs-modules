output "id" {
  value = (
    length(azurerm_synapse_workspace.adl_syn) > 0 ?
    azurerm_synapse_workspace.adl_syn[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_synapse_workspace.adl_syn) > 0 ?
    azurerm_synapse_workspace.adl_syn[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_synapse_workspace.adl_syn) > 0 ?
    azurerm_synapse_workspace.adl_syn[0].resource_group_name : ""
  )
}