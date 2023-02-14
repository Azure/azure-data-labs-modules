output "id" {
  value = (
    length(azurerm_eventhub_namespace.adl_evhns) > 0 ?
    azurerm_eventhub_namespace.adl_evhns[0].id : ""
  )
  description = "Resource identifier of the instance of Event Hub namespace."
}

output "name" {
  value = (
    length(azurerm_eventhub_namespace.adl_evhns) > 0 ?
    azurerm_eventhub_namespace.adl_evhns[0].name : ""
  )
  description = "The name of the Event Hub namespace."
}

output "resource_group_name" {
  value = (
    length(azurerm_eventhub_namespace.adl_evhns) > 0 ?
    azurerm_eventhub_namespace.adl_evhns[0].resource_group_name : ""
  )
  description = "Resource Group where the Event Hub namespace exists."
}