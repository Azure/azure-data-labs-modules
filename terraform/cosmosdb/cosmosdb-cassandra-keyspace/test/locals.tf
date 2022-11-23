locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cosmosdb-cassandra-keyspace"
    Toolkit = "Terraform"
  }

  dns_cosmos_cassandra = "privatelink.cassandra.cosmos.azure.com"
}