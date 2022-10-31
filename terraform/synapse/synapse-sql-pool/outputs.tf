output "id" {
  value = (
    length(azurerm_synapse_sql_pool.syn_syndp) > 0 ?
    azurerm_synapse_sql_pool.syn_syndp[0].id : ""
  )
}