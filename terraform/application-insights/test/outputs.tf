output "id" {
  value = module.application_insights.id
}

output "instrumentation_key" {
  value     = module.application_insights.instrumentation_key
  sensitive = true
}

output "name" {
  value = module.application_insights.name
}

output "resource_group_name" {
  value = module.application_insights.resource_group_name
}