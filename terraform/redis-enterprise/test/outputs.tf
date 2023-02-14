output "id" {
  value = module.redis_enterprise.id
}

output "name" {
  value = module.redis_enterprise.name
}

output "hostname" {
  value = module.redis_enterprise.hostname
}

output "resource_group_name" {
  value = module.redis_enterprise.resource_group_name
}

output "port" {
  value = module.redis_enterprise.port
}

output "primary_access_key" {
  value     = module.redis_enterprise.primary_access_key
  sensitive = true
}