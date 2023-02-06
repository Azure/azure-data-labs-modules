output "id" {
  value = azurerm_servicebus_namespace.adl_sb.id
}

output "name" {
  value = azurerm_servicebus_namespace.adl_sb.name
}

output "resource_group_name" {
  value = azurerm_servicebus_namespace.adl_sb.resource_group_name
}

output "primary_connection_string" {
  value     = azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule.primary_connection_string
  sensitive = true
}

output "secondary_connection_string" {
  value     = azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule.secondary_connection_string
  sensitive = true
}