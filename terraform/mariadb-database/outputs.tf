output "id" {
  value = (
    length(azurerm_mariadb_database.adl_mariadb) > 0 ?
    azurerm_mariadb_database.adl_mariadb[0].id : ""
  )
  description = "Resource identifier of the instance of MariaDB database."
}

output "database_name" {
  value = (
    length(azurerm_mariadb_database.adl_mariadb) > 0 ?
    azurerm_mariadb_database.adl_mariadb[0].name : ""
  )
  description = "The name of the MariaDB database."
}

output "server_name" {
  value = (
    length(azurerm_mariadb_server.adl_mariadb_server) > 0 ?
    azurerm_mariadb_server.adl_mariadb_server[0].name : ""
  )
  description = "The name of the MariaDB server."
}

output "resource_group_name" {
  value = (
    length(azurerm_mariadb_database.adl_mariadb) > 0 ?
    azurerm_mariadb_database.adl_mariadb[0].resource_group_name : ""
  )
  description = "Resource Group where the MariaDB database exists."
}