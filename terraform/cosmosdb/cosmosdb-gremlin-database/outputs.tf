output "id" {
  value = (
    length(azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin) > 0 ?
    azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin[0].id : ""
  )
}
output "name" {
  value = (
    length(azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin) > 0 ?
    azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin[0].name : ""
  )
}
output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin) > 0 ?
    azurerm_cosmosdb_gremlin_database.adl_cosmos_gremlin[0].resource_group_name : ""
  )
}