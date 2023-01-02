output "name" {
  value = (
    length(azurerm_cosmosdb_table.adl_cosmos_table) > 0 ?
    azurerm_cosmosdb_table.adl_cosmos_table[0].name : ""
  )
}