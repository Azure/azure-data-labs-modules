output "id" {
  value = (
    length(azurerm_virtual_network.adl_vnet) > 0 ?
    azurerm_virtual_network.adl_vnet[0].id : ""
  )
  description = "Resource identifier of the instance of Virtual Network."
}

output "name" {
  value = (
    length(azurerm_virtual_network.adl_vnet) > 0 ?
    azurerm_virtual_network.adl_vnet[0].name : ""
  )
  description = "The name of the Virtual Network."
}

output "resource_group_name" {
  value = (
    length(azurerm_virtual_network.adl_vnet) > 0 ?
    azurerm_virtual_network.adl_vnet[0].resource_group_name : ""
  )
  description = "Resource Group where the Virtual Network exists."
}