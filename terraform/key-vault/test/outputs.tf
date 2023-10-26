output "id" {
  value = module.key_vault.id
}

output "name" {
  value = module.key_vault.name
}

output "resource_group_name" {
  value = module.key_vault.resource_group_name
}

//Test data
output "data_client_id" {
  value = module.key_vault.data_client_id
}
output "data_object_id" {
  value = module.key_vault.current.object_id
}
output "data_id" {
  value = module.key_vault.current.id
}
