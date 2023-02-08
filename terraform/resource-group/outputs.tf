output "id" {
  value = (
    length(azurerm_resource_group.adl_rg) > 0 ?
    azurerm_resource_group.adl_rg[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_resource_group.adl_rg) > 0 ?
    azurerm_resource_group.adl_rg[0].name : ""
  )
}

output "location" {
  value = (
    length(azurerm_resource_group.adl_rg) > 0 ?
    azurerm_resource_group.adl_rg[0].location : ""
  )
}