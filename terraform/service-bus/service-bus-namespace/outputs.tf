output "id" {
  value = azurerm_servicebus_namespace.adl_sb.id
}

output "primary_connection_string" {
  value     = azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule.primary_connection_string
  sensitive = true
}

output "secondary_connection_string" {
  value     = azurerm_servicebus_namespace_authorization_rule.adl_sb_auth_rule.secondary_connection_string
  sensitive = true
}
