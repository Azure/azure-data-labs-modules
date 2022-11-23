locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "sql-server-database"
    Toolkit = "Terraform"
  }

  dns_sql_server = "privatelink.database.windows.net"
}