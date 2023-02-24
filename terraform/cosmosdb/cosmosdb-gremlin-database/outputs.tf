output "id" {
  value = (
    length(azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin) > 0 ?
    azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin[0].id : ""
  )
  description = "Resource identifier of the instance of CosmosDB Gremlin database."
}

output "name" {
  value = (
    length(azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin) > 0 ?
    azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin[0].name : ""
  )
  description = "The name of the CosmosDB Gremlin database."
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin) > 0 ?
    azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin[0].resource_group_name : ""
  )
  description = "Resource Group where the CosmosDB Gremlin database exists."
}