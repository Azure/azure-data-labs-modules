
output "id" {
  value = (
    length(azurerm_kubernetes_cluster.adl_aks) > 0 ?
    azurerm_kubernetes_cluster.adl_aks[0].id : ""
  )
}


output "name" {
  value = (
    length(azurerm_kubernetes_cluster.adl_aks) > 0 ?
    azurerm_kubernetes_cluster.adl_aks[0].name : ""
  )
}

output "all" {
  value = (
    length(azurerm_kubernetes_cluster.adl_aks) > 0 ?
    azurerm_kubernetes_cluster.adl_aks[0].* : []
  )
  sensitive = true
}
