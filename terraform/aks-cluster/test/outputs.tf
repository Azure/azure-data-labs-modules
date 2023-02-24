output "id" {
  value = module.aks.id
}

output "name" {
  value = module.aks.name
}

output "resource_group_name" {
  value = module.aks.resource_group_name
}

output "all" {
  value     = module.aks.all
  sensitive = true
}