output "id" {
  value = (
    length(azurerm_servicebus_namespace.adl_sb) > 0 ?
    azurerm_servicebus_namespace.adl_sb[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_servicebus_namespace.adl_sb) > 0 ?
    azurerm_servicebus_namespace.adl_sb[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_servicebus_namespace.adl_sb) > 0 ?
    azurerm_servicebus_namespace.adl_sb[0].resource_group_name : ""
  )
}

output "primary_connection_string" {
  value = (
    length(azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule) > 0 ?
    azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule[0].primary_connection_string : ""
  )
  sensitive = true
}

output "secondary_connection_string" {
  value = (
    length(azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule) > 0 ?
    azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule[0].secondary_connection_string : ""
  )
  sensitive = true
}