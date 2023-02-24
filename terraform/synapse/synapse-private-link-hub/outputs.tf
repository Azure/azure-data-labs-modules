output "id" {
  value = (
    length(azurerm_synapse_private_link_hub.syn_synplh) > 0 ?
    azurerm_synapse_private_link_hub.syn_synplh[0].id : ""
  )
  description = "Resource identifier of the instance of Synapse Private Link Hub."
}

output "name" {
  value = (
    length(azurerm_synapse_private_link_hub.syn_synplh) > 0 ?
    azurerm_synapse_private_link_hub.syn_synplh[0].name : ""
  )
  description = "The name of the Synapse Private Link Hub."
}

output "resource_group_name" {
  value = (
    length(azurerm_synapse_private_link_hub.syn_synplh) > 0 ?
    azurerm_synapse_private_link_hub.syn_synplh[0].resource_group_name : ""
  )
  description = "Resource Group where the Synapse Private Link Hub exists."
}