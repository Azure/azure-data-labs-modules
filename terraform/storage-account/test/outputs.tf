output "id" {
  value = module.storage_account.id
}

output "name" {
  value = module.storage_account.name
}

output "resource_group_name" {
  value = module.storage_account.resource_group_name
}

output "adls_id" {
  value = module.storage_account.adls_id
}

output "access_key" {
  value     = module.storage_account.access_key
  sensitive = true
}