output "id" {
  value = (
    length(azurerm_servicebus_namespace.adl_sb) > 0 ?
    azurerm_servicebus_namespace.adl_sb[0].id : ""
  )
  description = "Resource identifier of the instance of Service Bus namespace."
}

output "name" {
  value = (
    length(azurerm_servicebus_namespace.adl_sb) > 0 ?
    azurerm_servicebus_namespace.adl_sb[0].name : ""
  )
  description = "The name of the Service Bus namespace."
}

output "resource_group_name" {
  value = (
    length(azurerm_servicebus_namespace.adl_sb) > 0 ?
    azurerm_servicebus_namespace.adl_sb[0].resource_group_name : ""
  )
  description = "Resource Group where the Service Bus namespace exists."
}

output "primary_connection_string" {
  value = (
    length(azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule) > 0 ?
    azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule[0].primary_connection_string : ""
  )
  description = "Primary connection string for the Service Bus namespace exists."
  sensitive   = true
}

output "secondary_connection_string" {
  value = (
    length(azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule) > 0 ?
    azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule[0].secondary_connection_string : ""
  )
  description = "Secondary connection string for the Service Bus namespace exists."
  sensitive   = true
}