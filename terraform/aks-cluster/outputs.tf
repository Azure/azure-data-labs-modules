output "id" {
  value = azurerm_kubernetes_cluster.adl_aks.id
}

output "name" {
  value = azurerm_kubernetes_cluster.adl_aks.name
}

output "resource_group_name" {
  value = azurerm_kubernetes_cluster.adl_aks.resource_group_name
}

output "all" {
  value     = azurerm_kubernetes_cluster.adl_aks
  sensitive = true
}