output "id" {
  value       = azurerm_hdinsight_hadoop_cluster.adl_hdi_hadoop.id
  description = "Resource identifier of the instance of HDInsight Haddop."
}

output "name" {
  value       = azurerm_hdinsight_hadoop_cluster.adl_hdi_hadoop.name
  description = "The name of the HDInsight Haddop."
}

output "resource_group_name" {
  value       = azurerm_hdinsight_hadoop_cluster.adl_hdi_hadoop.resource_group_name
  description = "Resource Group where the HDInsight Haddop exists."
}