output "id" {
  value = (
    length(azurerm_cosmosdb_mongo_database.adl_cosmos_mongo) > 0 ?
    azurerm_cosmosdb_mongo_database.adl_cosmos_mongo[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_cosmosdb_mongo_database.adl_cosmos_mongo) > 0 ?
    azurerm_cosmosdb_mongo_database.adl_cosmos_mongo[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_mongo_database.adl_cosmos_mongo) > 0 ?
    azurerm_cosmosdb_mongo_database.adl_cosmos_mongo[0].resource_group_name : ""
  )
}