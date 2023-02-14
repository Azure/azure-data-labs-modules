output "id" {
  value = (
    length(azurerm_eventgrid_domain.adl_evgd) > 0 ?
    azurerm_eventgrid_domain.adl_evgd[0].id : ""
  )
  description = "Resource identifier of the instance of Event Grid domain."
}

output "name" {
  value = (
    length(azurerm_eventgrid_domain.adl_evgd) > 0 ?
    azurerm_eventgrid_domain.adl_evgd[0].name : ""
  )
  description = "The name of the Event Grid domain."
}

output "resource_group_name" {
  value = (
    length(azurerm_eventgrid_domain.adl_evgd) > 0 ?
    azurerm_eventgrid_domain.adl_evgd[0].resource_group_name : ""
  )
  description = "Resource Group where the Event Grid domain exists."
}