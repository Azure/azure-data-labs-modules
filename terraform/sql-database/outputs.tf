output "id" {
  value = (
    length(azurerm_sql_database.adl_sqldb) > 0 ?
    azurerm_sql_database.adl_sqldb[0].id : ""
  )
}
