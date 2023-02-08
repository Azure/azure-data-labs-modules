output "id" {
  value = (
    length(azurerm_route.adl_r) > 0 ?
    azurerm_route.adl_r[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_route.adl_r) > 0 ?
    azurerm_route.adl_r[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_route.adl_r) > 0 ?
    azurerm_route.adl_r[0].resource_group_name : ""
  )
}