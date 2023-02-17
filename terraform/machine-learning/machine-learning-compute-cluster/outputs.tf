output "id" {
  value = (
    length(azurerm_machine_learning_compute_cluster.adl_mlw_compute_cluster) > 0 ?
    azurerm_machine_learning_compute_cluster.adl_mlw_compute_cluster[0].id : ""
  )
  description = "Resource identifier of the instance of Machine Learning Compute Cluster."
}

output "name" {
  value = (
    length(azurerm_machine_learning_compute_cluster.adl_mlw_compute_cluster) > 0 ?
    azurerm_machine_learning_compute_cluster.adl_mlw_compute_cluster[0].name : ""
  )
  description = "The name of the Machine Learning Compute Cluster."
}