output "id" {
  value = (
    length(azurerm_network_security_group.adl_nsg) > 0 ?
    azurerm_network_security_group.adl_nsg[0].id : ""
  )
  description = "Resource identifier of the instance of Network Security Group."
}

output "name" {
  value = (
    length(azurerm_network_security_group.adl_nsg) > 0 ?
    azurerm_network_security_group.adl_nsg[0].name : ""
  )
  description = "The name of the Network Security Group."
}

output "resource_group_name" {
  value = (
    length(azurerm_network_security_group.adl_nsg) > 0 ?
    azurerm_network_security_group.adl_nsg[0].resource_group_name : ""
  )
  description = "Resource Group where the Network Security Group exists."
}