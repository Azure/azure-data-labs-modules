output "id" {
  value = (
    length(azurerm_cosmosdb_sql_database.adl_cosmos_sql) > 0 ?
    azurerm_cosmosdb_sql_database.adl_cosmos_sql[0].id : ""
  )
  description = "Resource identifier of the instance of CosmosDB SQL database."
}

output "name" {
  value = (
    length(azurerm_cosmosdb_sql_database.adl_cosmos_sql) > 0 ?
    azurerm_cosmosdb_sql_database.adl_cosmos_sql[0].name : ""
  )
  description = "The name of the CosmosDB SQL database."
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_sql_database.adl_cosmos_sql) > 0 ?
    azurerm_cosmosdb_sql_database.adl_cosmos_sql[0].resource_group_name : ""
  )
  description = "Resource Group where the CosmosDB SQL database exists."
}