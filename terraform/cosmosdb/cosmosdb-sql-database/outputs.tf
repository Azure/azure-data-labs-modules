output "name" {
  value = (
    length(azurerm_cosmosdb_sql_database.adl_cosmos_sql) > 0 ?
    azurerm_cosmosdb_sql_database.adl_cosmos_sql[0].name : ""
  )
}