output "id" {
  value = (
    length(azurerm_lb.adl_lb) > 0 ?
    azurerm_lb.adl_lb[0].id : ""
  )
  description = "Resource identifier of the instance of Azure Load Balancer."
}

output "name" {
  value = (
    length(azurerm_lb.adl_lb) > 0 ?
    azurerm_lb.adl_lb[0].name : ""
  )
  description = "The name of the Azure Load Balancer."
}

output "resource_group_name" {
  value = (
    length(azurerm_lb.adl_lb) > 0 ?
    azurerm_lb.adl_lb[0].resource_group_name : ""
  )
  description = "Resource Group where the Azure Load Balancer exists."
}