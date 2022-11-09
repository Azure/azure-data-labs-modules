
output "aks_id" {
  value = module.adl_aks.id
}

output "aks_name" {
  value = module.adl_aks.name
}


output "aks_all" {
  value     = module.adl_aks
  sensitive = true
}
