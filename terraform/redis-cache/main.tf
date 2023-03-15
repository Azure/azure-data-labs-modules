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
  public_network_access_enabled = var.is_sec_module ? false : true
  redis_configuration {
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_private_endpoint" "sql_pe_redis" {
  name                = "pe-${azurerm_redis_cache.adl_redis[0].name}-redis"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-redis-${var.basename}"
    private_connection_resource_id = azurerm_redis_cache.adl_redis[0].id
    subresource_names              = ["redisCache"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-redis"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}