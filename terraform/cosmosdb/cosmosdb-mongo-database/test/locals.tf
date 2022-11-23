locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cosmosdb-mongo-database"
    Toolkit = "Terraform"
  }

  dns_cosmos_mongo = "privatelink.mongo.cosmos.azure.com"
}