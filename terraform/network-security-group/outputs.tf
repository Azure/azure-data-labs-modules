output "id" {
  value = (
    length(azurerm_network_security_group.adl_nsg) > 0 ?
    azurerm_network_security_group.adl_nsg[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_network_security_group.adl_nsg) > 0 ?
    azurerm_network_security_group.adl_nsg[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_network_security_group.adl_nsg) > 0 ?
    azurerm_network_security_group.adl_nsg[0].resource_group_name : ""
  )
}