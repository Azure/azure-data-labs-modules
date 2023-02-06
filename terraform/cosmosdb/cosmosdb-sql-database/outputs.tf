output "id" {
  value = (
    length(azurerm_cosmosdb_sql_database.adl_cosmos_sql) > 0 ?
    azurerm_cosmosdb_sql_database.adl_cosmos_sql[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_cosmosdb_sql_database.adl_cosmos_sql) > 0 ?
    azurerm_cosmosdb_sql_database.adl_cosmos_sql[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_sql_database.adl_cosmos_sql) > 0 ?
    azurerm_cosmosdb_sql_database.adl_cosmos_sql[0].resource_group_name : ""
  )
}