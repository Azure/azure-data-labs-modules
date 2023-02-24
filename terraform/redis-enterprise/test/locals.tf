locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "redis-enterprise"
    Toolkit = "Terraform"
  }

  dns_redis = "privatelink.redisenterprise.cache.azure.net"
}