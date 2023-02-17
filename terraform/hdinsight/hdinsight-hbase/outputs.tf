output "id" {
  value       = azurerm_hdinsight_hbase_cluster.adl_hdi_hbase.id
  description = "Resource identifier of the instance of HDInsight HBase."
}

output "name" {
  value       = azurerm_hdinsight_hbase_cluster.adl_hdi_hbase.name
  description = "The name of the HDInsight HBase."
}

output "resource_group_name" {
  value       = azurerm_hdinsight_hbase_cluster.adl_hdi_hbase.resource_group_name
  description = "Resource Group where the HDInsight HBase exists."
}