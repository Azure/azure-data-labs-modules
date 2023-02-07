output "id" {
  value = module.event_hubs_namespace.id
}

output "name" {
  value = module.event_hubs_namespace.name
}

output "resource_group_name" {
  value = module.event_hubs_namespace.resource_group_name
}

output "primary_connection_string" {
  value = module.event_hubs_namespace.primary_connection_string
}

output "secondary_connection_string" {
  value = module.event_hubs_namespace.secondary_connection_string
}