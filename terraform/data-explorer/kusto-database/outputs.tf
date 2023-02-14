output "name" {
  value = (
    length(azurerm_kusto_database.adl_dedb) > 0 ?
    azurerm_kusto_database.adl_dedb[0].name : ""
  )
  description = "The name of the Azure Data Explorer database."
}

output "resource_group_name" {
  value = (
    length(azurerm_kusto_database.adl_dedb) > 0 ?
    azurerm_kusto_database.adl_dedb[0].resource_group_name : ""
  )
  description = "Resource Group where the Azure Data Explorer database exists."
}