output "id" {
  value = (
    length(azurerm_mysql_flexible_database.adl_mysql) > 0 ?
    azurerm_mysql_flexible_database.adl_mysql[0].id : ""
  )
}