output "id" {
  value = (
    length(azurerm_sql_server.adl_sql) > 0 ?
    azurerm_sql_server.adl_sql[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_sql_server.adl_sql) > 0 ?
    azurerm_sql_server.adl_sql[0].name : ""
  )
}