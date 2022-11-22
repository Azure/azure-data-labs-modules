locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "mariadb-database"
    Toolkit = "Terraform"
  }

  dns_mariadb_server = "privatelink.mariadb.database.azure.com"
}