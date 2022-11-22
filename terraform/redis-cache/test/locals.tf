locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "redis-cache"
    Toolkit = "Terraform"
  }

  dns_redis = "privatelink.redis.cache.windows.net"
}