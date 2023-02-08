output "id" {
  value = (
    length(azurerm_route_table.adl_rt) > 0 ?
    azurerm_route_table.adl_rt[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_route_table.adl_rt) > 0 ?
    azurerm_route_table.adl_rt[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_route_table.adl_rt) > 0 ?
    azurerm_route_table.adl_rt[0].resource_group_name : ""
  )
}
