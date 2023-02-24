output "id" {
  value = (
    length(azurerm_eventgrid_topic.adl_evgt) > 0 ?
    azurerm_eventgrid_topic.adl_evgt[0].id : ""
  )
  description = "Resource identifier of the instance of Event Grid topic."
}

output "name" {
  value = (
    length(azurerm_eventgrid_topic.adl_evgt) > 0 ?
    azurerm_eventgrid_topic.adl_evgt[0].name : ""
  )
  description = "The name of the Event Grid topic."
}

output "resource_group_name" {
  value = (
    length(azurerm_eventgrid_topic.adl_evgt) > 0 ?
    azurerm_eventgrid_topic.adl_evgt[0].resource_group_name : ""
  )
  description = "Resource Group where the Event Grid topic exists."
}
