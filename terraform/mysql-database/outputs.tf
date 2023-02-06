output "id" {
  value = (
    length(azurerm_mysql_flexible_database.adl_mysql) > 0 ?
    azurerm_mysql_flexible_database.adl_mysql[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_mysql_flexible_database.adl_mysql) > 0 ?
    azurerm_mysql_flexible_database.adl_mysql[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_mysql_flexible_database.adl_mysql) > 0 ?
    azurerm_mysql_flexible_database.adl_mysql[0].resource_group_name : ""
  )
}