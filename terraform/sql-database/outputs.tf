output "id" {
  value = (
    length(azurerm_mssql_database.adl_sqldb) > 0 ?
    azurerm_mssql_database.adl_sqldb[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_mssql_database.adl_sqldb) > 0 ?
    azurerm_mssql_database.adl_sqldb[0].name : ""
  )
}