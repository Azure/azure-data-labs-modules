output "id" {
  value = (
    length(azurerm_cosmosdb_account.adl_cosmos) > 0 ?
    azurerm_cosmosdb_account.adl_cosmos[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_cosmosdb_account.adl_cosmos) > 0 ?
    azurerm_cosmosdb_account.adl_cosmos[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_account.adl_cosmos) > 0 ?
    azurerm_cosmosdb_account.adl_cosmos[0].resource_group_name : ""
  )
}