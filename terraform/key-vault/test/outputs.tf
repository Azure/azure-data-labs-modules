output "id" {
  value = module.key_vault.id
}

output "name" {
  value = module.key_vault.name
}

output "resource_group_name" {
  value = module.key_vault.resource_group_name
}

output "data_client_id" {
  value = data.azurerm_client_config.current.client_id
}
output "data_object_id" {
  value = data.azurerm_client_config.current.object_id
}
output "data_id" {
  value = data.azurerm_client_config.current.id
}
