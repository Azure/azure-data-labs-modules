output "id" {
  value = (
    length(azurerm_synapse_workspace.adl_syn) > 0 ?
    azurerm_synapse_workspace.adl_syn[0].id : ""
  )
}