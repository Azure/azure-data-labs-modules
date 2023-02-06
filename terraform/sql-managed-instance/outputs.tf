output "id" {
  value = (
    length(azurerm_mssql_managed_instance.adl_sqlmi) > 0 ?
    azurerm_mssql_managed_instance.adl_sqlmi[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_mssql_managed_instance.adl_sqlmi) > 0 ?
    azurerm_mssql_managed_instance.adl_sqlmi[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_mssql_managed_instance.adl_sqlmi) > 0 ?
    azurerm_mssql_managed_instance.adl_sqlmi[0].resource_group_name : ""
  )
}