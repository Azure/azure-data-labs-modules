output "id" {
  value = (
    length(azurerm_virtual_network_peering.adl_peer) > 0 ?
    azurerm_virtual_network_peering.adl_peer[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_virtual_network_peering.adl_peer) > 0 ?
    azurerm_virtual_network_peering.adl_peer[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_virtual_network_peering.adl_peer) > 0 ?
    azurerm_virtual_network_peering.adl_peer[0].resource_group_name : ""
  )
}