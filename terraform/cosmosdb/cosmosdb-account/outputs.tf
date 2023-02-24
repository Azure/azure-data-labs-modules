output "id" {
  value = (
    length(azurerm_cosmosdb_account.adl_cosmos) > 0 ?
    azurerm_cosmosdb_account.adl_cosmos[0].id : ""
  )
  description = "Resource identifier of the instance of CosmosDB account."
}

output "name" {
  value = (
    length(azurerm_cosmosdb_account.adl_cosmos) > 0 ?
    azurerm_cosmosdb_account.adl_cosmos[0].name : ""
  )
  description = "The name of the CosmosDB account."
}

output "resource_group_name" {
  value = (
    length(azurerm_cosmosdb_account.adl_cosmos) > 0 ?
    azurerm_cosmosdb_account.adl_cosmos[0].resource_group_name : ""
  )
  description = "Resource Group where the CosmosDB account exists."
}