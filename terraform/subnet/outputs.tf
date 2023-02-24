output "id" {
  value = (
    length(azurerm_subnet.adl_snet) > 0 ?
    azurerm_subnet.adl_snet[0].id : ""
  )
  description = "Resource identifier of the instance of Subnet."
}

output "name" {
  value = (
    length(azurerm_subnet.adl_snet) > 0 ?
    azurerm_subnet.adl_snet[0].name : ""
  )
  description = "The name of the Subnet."
}

output "resource_group_name" {
  value = (
    length(azurerm_subnet.adl_snet) > 0 ?
    azurerm_subnet.adl_snet[0].resource_group_name : ""
  )
  description = "Resource Group where the Subnet exists."
}