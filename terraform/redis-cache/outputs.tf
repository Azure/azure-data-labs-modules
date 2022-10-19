output "id" {
  value = (
    length(azurerm_redis_cache.adl_redis) > 0 ?
    azurerm_redis_cache.adl_redis[0].id : ""
  )
}