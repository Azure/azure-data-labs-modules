locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "sql-managed-instance"
    Toolkit = "Terraform"
  }

  dns_sql_server = "privatelink.database.windows.net"
}
