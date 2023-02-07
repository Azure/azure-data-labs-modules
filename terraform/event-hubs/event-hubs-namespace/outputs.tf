output "id" {
  value = (
    length(azurerm_eventhub_namespace.adl_evhns) > 0 ?
    azurerm_eventhub_namespace.adl_evhns[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_eventhub_namespace.adl_evhns) > 0 ?
    azurerm_eventhub_namespace.adl_evhns[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_eventhub_namespace.adl_evhns) > 0 ?
    azurerm_eventhub_namespace.adl_evhns[0].resource_group_name : ""
  )
}