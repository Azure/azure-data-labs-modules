output "id" {
  value = (
    length(azurerm_cosmosdb_mongo_database.adl_cosmos_mongo) > 0 ?
    azurerm_cosmosdb_mongo_database.adl_cosmos_mongo[0].id : ""
  )
  description = "Resource identifier of the instance of CosmosDB Mongo database."
}

output "name" {
  value = (
    length(azurerm_cosmosdb_mongo_database.adl_cosmos_mongo) > 0 ?
    azurerm_cosmosdb_mongo_database.adl_cosmos_mongo[0].name : ""
  )
  description = "The name of the CosmosDB Mongo database."
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_mongo_database.adl_cosmos_mongo) > 0 ?
    azurerm_cosmosdb_mongo_database.adl_cosmos_mongo[0].resource_group_name : ""
  )
  description = "Resource Group where the CosmosDB Mongo database exists."
}