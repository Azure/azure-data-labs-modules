locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cosmosdb-gremlin-database"
    Toolkit = "Terraform"
  }

  snet_name          = "snet-adl-modules-test-default"
  vnet_name          = "vnet-adl-modules-test-we"
  dns_cosmos_gremlin = "privatelink.gremlin.cosmos.azure.com"
}