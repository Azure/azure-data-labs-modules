
output "id" {
  value = module.aks.id
}

output "name" {
  value = module.aks.name
}

output "all" {
  value     = module.aks.all
  sensitive = true
}
