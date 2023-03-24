# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_enterprise_cluster
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_enterprise_database

# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_enterprise_cluster" "adl_redis_enterprise" {
  name                = "redis-enterprise-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = local.sku_name
  minimum_tls_version = var.minimum_tls_version
  tags                = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_redis_enterprise_database" "adl_redis_database" {
  name              = "default"
  cluster_id        = azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].id
  clustering_policy = var.clustering_policy
  client_protocol   = var.client_protocol
  eviction_policy   = var.eviction_policy

  count = var.module_enabled ? 1 : 0
}

module "sql_pe_redis" {
  source                         = "../private-endpoint"
  basename                       = "${azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].name}-redis-enterprise"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].id
  subresource_names              = ["redisEnterprise"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}