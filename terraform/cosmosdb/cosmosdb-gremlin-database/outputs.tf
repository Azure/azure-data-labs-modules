output "name" {
  value = (
    length(azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin) > 0 ?
    azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin[0].name : ""
  )
}