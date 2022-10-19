output "id" {
  value = (
    length(azurerm_postgresql_database.adl_psql) > 0 ?
    azurerm_postgresql_database.adl_psql[0].id : ""
  )
}