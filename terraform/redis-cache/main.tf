# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache

# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "adl_redis" {
  name                          = "redis-${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  capacity                      = var.capacity
  family                        = var.family
  sku_name                      = var.sku_name
  enable_non_ssl_port           = var.enable_non_ssl_port
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled
  redis_configuration {
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

module "sql_pe_redis" {
  source                         = "../private-endpoint"
  basename                       = "${azurerm_redis_cache.adl_redis[0].name}-redis"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_redis_cache.adl_redis[0].id
  subresource_names              = ["redisCache"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}