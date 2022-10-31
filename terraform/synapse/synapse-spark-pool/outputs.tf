output "id" {
  value = (
    length(azurerm_synapse_spark_pool.syn_synsp) > 0 ?
    azurerm_synapse_spark_pool.syn_synsp[0].id : ""
  )
}