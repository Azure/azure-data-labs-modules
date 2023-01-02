output "name" {
  value = (
    length(azurerm_cosmosdb_mongo_database.adl_cosmos_mongo) > 0 ?
    azurerm_cosmosdb_mongo_database.adl_cosmos_mongo[0].name : ""
  )
}