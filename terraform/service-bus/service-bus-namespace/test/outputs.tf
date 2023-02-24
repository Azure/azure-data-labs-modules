output "id" {
  value = module.service_bus_namespace.id
}

output "name" {
  value = module.service_bus_namespace.name
}

output "resource_group_name" {
  value = module.service_bus_namespace.resource_group_name
}

output "primary_connection_string" {
  value     = module.service_bus_namespace.primary_connection_string
  sensitive = true
}

output "secondary_connection_string" {
  value     = module.service_bus_namespace.secondary_connection_string
  sensitive = true
}