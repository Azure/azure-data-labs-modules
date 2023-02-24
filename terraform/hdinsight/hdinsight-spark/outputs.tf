output "id" {
  value       = azurerm_hdinsight_spark_cluster.adl_hdi_spark.id
  description = "Resource identifier of the instance of HDInsight Spark."
}

output "name" {
  value       = azurerm_hdinsight_spark_cluster.adl_hdi_spark.name
  description = "The name of the HDInsight Spark."
}

output "resource_group_name" {
  value       = azurerm_hdinsight_spark_cluster.adl_hdi_spark.resource_group_name
  description = "Resource Group where the HDInsight Spark exists."
}