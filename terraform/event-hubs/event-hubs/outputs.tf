output "id" {
  value = (
    length(azurerm_eventhub.adl_evh) > 0 ?
    azurerm_eventhub.adl_evh[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_eventhub.adl_evh) > 0 ?
    azurerm_eventhub.adl_evh[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_eventhub.adl_evh) > 0 ?
    azurerm_eventhub.adl_evh[0].resource_group_name : ""
  )
}

output "primary_connection_string" {
  value = (
    length(azurerm_eventhub_authorization_rule.adl_evh_auth_rule) > 0 ?
    azurerm_eventhub_authorization_rule.adl_evh_auth_rule[0].primary_connection_string : ""
  )
  sensitive = true
}

output "secondary_connection_string" {
  value = (
    length(azurerm_eventhub_authorization_rule.adl_evh_auth_rule) > 0 ?
    azurerm_eventhub_authorization_rule.adl_evh_auth_rule[0].secondary_connection_string : ""
  )
  sensitive = true
}