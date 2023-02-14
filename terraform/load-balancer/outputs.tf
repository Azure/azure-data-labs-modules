output "id" {
  value = (
    length(azurerm_lb.adl_lb) > 0 ?
    azurerm_lb.adl_lb[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_lb.adl_lb) > 0 ?
    azurerm_lb.adl_lb[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_lb.adl_lb) > 0 ?
    azurerm_lb.adl_lb[0].resource_group_name : ""
  )
}