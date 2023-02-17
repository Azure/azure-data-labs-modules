output "id" {
  value = (
    length(azurerm_mysql_flexible_database.adl_mysql) > 0 ?
    azurerm_mysql_flexible_database.adl_mysql[0].id : ""
  )
  description = "Resource identifier of the instance of MySQL Flexible Server database."
}

output "database_name" {
  value = (
    length(azurerm_mysql_flexible_database.adl_mysql) > 0 ?
    azurerm_mysql_flexible_database.adl_mysql[0].name : ""
  )
  description = "The name of the MySQL Flexible Server database."
}

output "server_name" {
  value = (
    length(azurerm_mysql_flexible_server.adl_mysql_server) > 0 ?
    azurerm_mysql_flexible_server.adl_mysql_server[0].name : ""
  )
  description = "The name of the MySQL Flexible Server server."
}

output "resource_group_name" {
  value = (
    length(azurerm_mysql_flexible_server.adl_mysql_server) > 0 ?
    azurerm_mysql_flexible_server.adl_mysql_server[0].resource_group_name : ""
  )
  description = "Resource Group where the MySQL Flexible Server exists."
}