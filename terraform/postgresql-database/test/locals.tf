locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "postgresql-database"
    Toolkit = "Terraform"
  }

  dns_psql_server = "privatelink.postgres.database.azure.com"
}