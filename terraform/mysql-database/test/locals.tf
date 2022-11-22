locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "mysql-database"
    Toolkit = "Terraform"
  }

  dns_mysql_server = "privatelink.mysql.database.azure.com"
}