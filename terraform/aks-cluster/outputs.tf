output "id" {
  value = (
    length(azurerm_kubernetes_cluster.adl_aks) > 0 ?
    azurerm_kubernetes_cluster.adl_aks[0].id : ""
  )
  description = "Resource identifier of the instance of Managed Kubernetes Cluster."
}

output "name" {
  value = (
    length(azurerm_kubernetes_cluster.adl_aks) > 0 ?
    azurerm_kubernetes_cluster.adl_aks[0].name : ""
  )
  description = "The name of the Managed Kubernetes Cluster."
}

output "resource_group_name" {
  value = (
    length(azurerm_kubernetes_cluster.adl_aks) > 0 ?
    azurerm_kubernetes_cluster.adl_aks[0].resource_group_name : ""
  )
  description = "Resource Group where the Managed Kubernetes Cluster exists."
}

output "all" {
  value = (
    length(azurerm_kubernetes_cluster.adl_aks) > 0 ?
    azurerm_kubernetes_cluster.adl_aks[0] : null
  )
  description = "All attributes exported by the Managed Kubernetes Cluster."
  sensitive   = true
}