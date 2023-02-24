output "id" {
  value       = azurerm_hdinsight_interactive_query_cluster.adl_hdi_interactive.id
  description = "Resource identifier of the instance of HDInsight Interactive."
}

output "name" {
  value       = azurerm_hdinsight_interactive_query_cluster.adl_hdi_interactive.name
  description = "The name of the HDInsight Interactive."
}

output "resource_group_name" {
  value       = azurerm_hdinsight_interactive_query_cluster.adl_hdi_interactive.resource_group_name
  description = "Resource Group where the HDInsight Interactive exists."
}