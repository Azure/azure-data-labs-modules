output "id" {
  value = (
    length(azurerm_resource_group.adl_rg) > 0 ?
    azurerm_resource_group.adl_rg[0].id : ""
  )
  description = "Resource identifier of the instance of Resource Group."
}

output "name" {
  value = (
    length(azurerm_resource_group.adl_rg) > 0 ?
    azurerm_resource_group.adl_rg[0].name : ""
  )
  description = "The name of the Resource Group."
}

output "location" {
  value = (
    length(azurerm_resource_group.adl_rg) > 0 ?
    azurerm_resource_group.adl_rg[0].location : ""
  )
  description = "Location assigned to the Resource Group."
}