output "id" {
  value = module.self_hosted_integration_runtime.id
}

output "name" {
  value = module.self_hosted_integration_runtime.name
}

output "resource_group_name" {
  value = module.self_hosted_integration_runtime.resource_group_name
}

output "primary_authorization_key" {
  value     = module.self_hosted_integration_runtime.primary_authorization_key
  sensitive = true
}