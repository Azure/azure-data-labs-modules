output "id" {
  value = (
    length(azurerm_machine_learning_synapse_spark.adl_mlw_synapse_spark) > 0 ?
    azurerm_machine_learning_synapse_spark.adl_mlw_synapse_spark[0].id : ""
  )
}