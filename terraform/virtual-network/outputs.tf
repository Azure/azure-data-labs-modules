output "id" {
  value = (
    length(azurerm_virtual_network.adl_vnet) > 0 ?
    azurerm_virtual_network.adl_vnet[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_virtual_network.adl_vnet) > 0 ?
    azurerm_virtual_network.adl_vnet[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_virtual_network.adl_vnet) > 0 ?
    azurerm_virtual_network.adl_vnet[0].resource_group_name : ""
  )
}