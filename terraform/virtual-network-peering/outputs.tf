output "id" {
  value = (
    length(azurerm_virtual_network_peering.adl_peer) > 0 ?
    azurerm_virtual_network_peering.adl_peer[0].id : ""
  )
  description = "Resource identifier of the instance of Virtual Network Peering."
}

output "name" {
  value = (
    length(azurerm_virtual_network_peering.adl_peer) > 0 ?
    azurerm_virtual_network_peering.adl_peer[0].name : ""
  )
  description = "The name of the Virtual Network Peering."
}

output "resource_group_name" {
  value = (
    length(azurerm_virtual_network_peering.adl_peer) > 0 ?
    azurerm_virtual_network_peering.adl_peer[0].resource_group_name : ""
  )
  description = "Resource Group where the Virtual Network Peering exists."
}