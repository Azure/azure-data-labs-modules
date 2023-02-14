output "id" {
  value = (
    length(azurerm_mssql_database.adl_sqldb) > 0 ?
    azurerm_mssql_database.adl_sqldb[0].id : ""
  )
  description = "Resource identifier of the instance of SQL Database."
}

output "name" {
  value = (
    length(azurerm_mssql_database.adl_sqldb) > 0 ?
    azurerm_mssql_database.adl_sqldb[0].name : ""
  )
  description = "The name of the SQL Database."
}

output "server_id" {
  value = (
    length(azurerm_mssql_database.adl_sqldb) > 0 ?
    azurerm_mssql_database.adl_sqldb[0].server_id : ""
  )
  description = "Resource Group where the SQL Database exists."
}