output "id" {
  value = (
    length(azurerm_mssql_managed_instance.adl_sqlmi) > 0 ?
    azurerm_mssql_managed_instance.adl_sqlmi[0].id : ""
  )
  description = "Resource identifier of the instance of SQL Managed Instance."
}

output "name" {
  value = (
    length(azurerm_mssql_managed_instance.adl_sqlmi) > 0 ?
    azurerm_mssql_managed_instance.adl_sqlmi[0].name : ""
  )
  description = "The name of the SQL Managed Instance."
}

output "resource_group_name" {
  value = (
    length(azurerm_mssql_managed_instance.adl_sqlmi) > 0 ?
    azurerm_mssql_managed_instance.adl_sqlmi[0].resource_group_name : ""
  )
  description = "Resource Group where the SQL Managed Instance exists."
}