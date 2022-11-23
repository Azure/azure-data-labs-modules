locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cosmosdb-table"
    Toolkit = "Terraform"
  }

  dns_cosmos_table = "privatelink.table.cosmos.azure.com"
}