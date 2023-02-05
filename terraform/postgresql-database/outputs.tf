output "id" {
  value = (
    length(azurerm_postgresql_flexible_server_database.adl_psql) > 0 ?
    azurerm_postgresql_flexible_server_database.adl_psql[0].id : ""
  )
}