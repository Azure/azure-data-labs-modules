output "id" {
  value = (
    length(azurerm_eventhub.adl_evh) > 0 ?
    azurerm_eventhub.adl_evh[0].id : ""
  )
  description = "Resource identifier of the instance of Event Hub."
}

output "name" {
  value = (
    length(azurerm_eventhub.adl_evh) > 0 ?
    azurerm_eventhub.adl_evh[0].name : ""
  )
  description = "The name of the Event Hub."
}

output "resource_group_name" {
  value = (
    length(azurerm_eventhub.adl_evh) > 0 ?
    azurerm_eventhub.adl_evh[0].resource_group_name : ""
  )
  description = "Resource Group where the Event Hub exists."
}

output "primary_connection_string" {
  value = (
    length(azurerm_eventhub_authorization_rule.adl_evh_auth_rule) > 0 ?
    azurerm_eventhub_authorization_rule.adl_evh_auth_rule[0].primary_connection_string : ""
  )
  description = "Primary connection string of the instance of Event Hub."
  sensitive   = true
}

output "secondary_connection_string" {
  value = (
    length(azurerm_eventhub_authorization_rule.adl_evh_auth_rule) > 0 ?
    azurerm_eventhub_authorization_rule.adl_evh_auth_rule[0].secondary_connection_string : ""
  )
  description = "Secondary connection string of the instance of Event Hub."
  sensitive   = true
}