output "id" {
  value = (
    length(azurerm_eventgrid_topic.adl_evgt) > 0 ?
    azurerm_eventgrid_topic.adl_evgt[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_eventgrid_topic.adl_evgt) > 0 ?
    azurerm_eventgrid_topic.adl_evgt[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_eventgrid_topic.adl_evgt) > 0 ?
    azurerm_eventgrid_topic.adl_evgt[0].resource_group_name : ""
  )
}
