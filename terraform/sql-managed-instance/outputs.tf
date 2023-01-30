output "id" {
  value = (
    length(azurerm_mssql_managed_instance.adl_sqlmi) > 0 ?
    azurerm_mssql_managed_instance.adl_sqlmi[0].id : ""
  )
}