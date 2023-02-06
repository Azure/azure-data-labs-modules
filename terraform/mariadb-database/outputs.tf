output "id" {
  value = (
    length(azurerm_mariadb_database.adl_mariadb) > 0 ?
    azurerm_mariadb_database.adl_mariadb[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_mariadb_database.adl_mariadb) > 0 ?
    azurerm_mariadb_database.adl_mariadb[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_mariadb_database.adl_mariadb) > 0 ?
    azurerm_mariadb_database.adl_mariadb[0].resource_group_name : ""
  )
}