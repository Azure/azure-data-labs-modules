output "name" {
  value = (
    length(azurerm_kusto_database.adl_dedb) > 0 ?
    azurerm_kusto_database.adl_dedb[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_kusto_database.adl_dedb) > 0 ?
    azurerm_kusto_database.adl_dedb[0].resource_group_name : ""
  )
}