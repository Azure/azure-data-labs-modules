output "id" {
  value = (
    length(azurerm_mssql_server.adl_sql) > 0 ?
    azurerm_mssql_server.adl_sql[0].id : ""
  )
  description = "Resource identifier of the instance of SQL Database server."
}

output "name" {
  value = (
    length(azurerm_mssql_server.adl_sql) > 0 ?
    azurerm_mssql_server.adl_sql[0].name : ""
  )
  description = "The name of the SQL Database server."
}

output "resource_group_name" {
  value = (
    length(azurerm_mssql_server.adl_sql) > 0 ?
    azurerm_mssql_server.adl_sql[0].resource_group_name : ""
  )
  description = "Resource Group where the SQL Database server exists."
}

output "fully_qualified_domain_name" {
  value = (
    length(azurerm_mssql_server.adl_sql) > 0 ?
    azurerm_mssql_server.adl_sql[0].fully_qualified_domain_name : ""
  )
  description = "The fully qualified domain name of the Azure SQL Server."
}