output "id" {
  value = (
    length(azurerm_cosmosdb_table.adl_cosmos_table) > 0 ?
    azurerm_cosmosdb_table.adl_cosmos_table[0].id : ""
  )
  description = "Resource identifier of the instance of CosmosDB table."
}

output "name" {
  value = (
    length(azurerm_cosmosdb_table.adl_cosmos_table) > 0 ?
    azurerm_cosmosdb_table.adl_cosmos_table[0].name : ""
  )
  description = "The name of the CosmosDB table."
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_table.adl_cosmos_table) > 0 ?
    azurerm_cosmosdb_table.adl_cosmos_table[0].resource_group_name : ""
  )
  description = "Resource Group where the CosmosDB table exists."
}