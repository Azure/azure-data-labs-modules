locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cosmosdb-sql-database"
    Toolkit = "Terraform"
  }

  snet_name = "snet-adl-modules-test-default"

  vnet_name = "vnet-adl-modules-test-we"

  dns_cosmos_sql = "privatelink.documents.azure.com"
}