output "id" {
  value       = azurerm_hdinsight_kafka_cluster.adl_hdi_kafka.id
  description = "Resource identifier of the instance of HDInsight Kafka."
}

output "name" {
  value       = azurerm_hdinsight_kafka_cluster.adl_hdi_kafka.name
  description = "The name of the HDInsight Kafka."
}

output "resource_group_name" {
  value       = azurerm_hdinsight_kafka_cluster.adl_hdi_kafka.resource_group_name
  description = "Resource Group where the HDInsight Kafka exists."
}