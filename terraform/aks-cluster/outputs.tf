output "aks_id" {
  value = azurerm_kubernetes_cluster.adl_aks.id
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.adl_aks.name
}


output "aks_all" {
  value     = azurerm_kubernetes_cluster.adl_aks
  sensitive = true
}
