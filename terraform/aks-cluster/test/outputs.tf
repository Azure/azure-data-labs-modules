
output "aks_id" {
  value = module.aks.id
}

output "aks_name" {
  value = module.aks.name
}


output "aks_all" {
  value     = module.aks
  sensitive = true
}
