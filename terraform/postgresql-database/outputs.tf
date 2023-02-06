output "id" {
  value = (
    length(azurerm_postgresql_flexible_server_database.adl_psql) > 0 ?
    azurerm_postgresql_flexible_server_database.adl_psql[0].id : ""
  )
}

output "database_name" {
  value = (
    length(azurerm_postgresql_flexible_server_database.adl_psql) > 0 ?
    azurerm_postgresql_flexible_server_database.adl_psql[0].name : ""
  )
}

output "server_name" {
  value = (
    length(azurerm_postgresql_flexible_server.adl_psql_server) > 0 ?
    azurerm_postgresql_flexible_server.adl_psql_server[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_postgresql_flexible_server.adl_psql_server) > 0 ?
    azurerm_postgresql_flexible_server.adl_psql_server[0].resource_group_name : ""
  )
}