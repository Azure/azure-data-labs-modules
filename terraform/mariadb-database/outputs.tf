output "id" {
  value = (
    length(azurerm_mariadb_database.adl_mariadb) > 0 ?
    azurerm_mariadb_database.adl_mariadb[0].id : ""
  )
}