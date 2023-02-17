output "id" {
  value = (
    length(azurerm_route_table.adl_rt) > 0 ?
    azurerm_route_table.adl_rt[0].id : ""
  )
  description = "Resource identifier of the instance of network route table."
}

output "name" {
  value = (
    length(azurerm_route_table.adl_rt) > 0 ?
    azurerm_route_table.adl_rt[0].name : ""
  )
  description = "The name of the network route table."
}

output "resource_group_name" {
  value = (
    length(azurerm_route_table.adl_rt) > 0 ?
    azurerm_route_table.adl_rt[0].resource_group_name : ""
  )
  description = "Resource Group where the network route table exists."
}