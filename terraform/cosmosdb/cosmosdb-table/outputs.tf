output "id" {
  value = (
    length(azurerm_cosmosdb_table.adl_cosmos_table) > 0 ?
    azurerm_cosmosdb_table.adl_cosmos_table[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_cosmosdb_table.adl_cosmos_table) > 0 ?
    azurerm_cosmosdb_table.adl_cosmos_table[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_table.adl_cosmos_table) > 0 ?
    azurerm_cosmosdb_table.adl_cosmos_table[0].resource_group_name : ""
  )
}