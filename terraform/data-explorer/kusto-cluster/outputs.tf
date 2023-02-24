output "id" {
  value = (
    length(azurerm_kusto_cluster.adl_dec) > 0 ?
    azurerm_kusto_cluster.adl_dec[0].id : ""
  )
  description = "Resource identifier of the instance of Azure Data Explorer Cluster."
}

output "name" {
  value = (
    length(azurerm_kusto_cluster.adl_dec) > 0 ?
    azurerm_kusto_cluster.adl_dec[0].name : ""
  )
  description = "The name of the Azure Data Explorer Cluster."
}

output "resource_group_name" {
  value = (
    length(azurerm_kusto_cluster.adl_dec) > 0 ?
    azurerm_kusto_cluster.adl_dec[0].resource_group_name : ""
  )
  description = "Resource Group where the Azure Data Explorer Cluster exists."
}