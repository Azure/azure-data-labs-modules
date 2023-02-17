output "id" {
  value = (
    length(azurerm_postgresql_flexible_server_database.adl_psql) > 0 ?
    azurerm_postgresql_flexible_server_database.adl_psql[0].id : ""
  )
  description = "Resource identifier of the instance of PostgreSQL Flexible Server database."
}

output "database_name" {
  value = (
    length(azurerm_postgresql_flexible_server_database.adl_psql) > 0 ?
    azurerm_postgresql_flexible_server_database.adl_psql[0].name : ""
  )
  description = "The name of the PostgreSQL Flexible Server database."
}

output "server_name" {
  value = (
    length(azurerm_postgresql_flexible_server.adl_psql_server) > 0 ?
    azurerm_postgresql_flexible_server.adl_psql_server[0].name : ""
  )
  description = "The name of the PostgreSQL Flexible Server server."
}

output "resource_group_name" {
  value = (
    length(azurerm_postgresql_flexible_server.adl_psql_server) > 0 ?
    azurerm_postgresql_flexible_server.adl_psql_server[0].resource_group_name : ""
  )
  description = "Resource Group where the PostgreSQL Flexible Server server exists."
}