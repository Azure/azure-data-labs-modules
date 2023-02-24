output "id" {
  value = module.event_hubs.id
}

output "name" {
  value = module.event_hubs.name
}

output "resource_group_name" {
  value = module.event_hubs.resource_group_name
}

output "primary_connection_string" {
  value     = module.event_hubs.primary_connection_string
  sensitive = true
}

output "secondary_connection_string" {
  value     = module.event_hubs.secondary_connection_string
  sensitive = true
}