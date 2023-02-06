output "id" {
  value = (
    length(azurerm_synapse_private_link_hub.syn_synplh) > 0 ?
    azurerm_synapse_private_link_hub.syn_synplh[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_synapse_private_link_hub.syn_synplh) > 0 ?
    azurerm_synapse_private_link_hub.syn_synplh[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_synapse_private_link_hub.syn_synplh) > 0 ?
    azurerm_synapse_private_link_hub.syn_synplh[0].resource_group_name : ""
  )
}