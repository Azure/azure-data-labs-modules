output "id" {
  value = (
    length(azurerm_route.adl_r) > 0 ?
    azurerm_route.adl_r[0].id : ""
  )
  description = "Resource identifier of the instance of network route."
}

output "name" {
  value = (
    length(azurerm_route.adl_r) > 0 ?
    azurerm_route.adl_r[0].name : ""
  )
  description = "The name of the network route."
}

output "resource_group_name" {
  value = (
    length(azurerm_route.adl_r) > 0 ?
    azurerm_route.adl_r[0].resource_group_name : ""
  )
  description = "Resource Group where the network route exists."
}