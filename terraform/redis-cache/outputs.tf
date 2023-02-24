output "id" {
  value = (
    length(azurerm_redis_cache.adl_redis) > 0 ?
    azurerm_redis_cache.adl_redis[0].id : ""
  )
  description = "Resource identifier of the instance of Redis Cache."
}

output "name" {
  value = (
    length(azurerm_redis_cache.adl_redis) > 0 ?
    azurerm_redis_cache.adl_redis[0].name : ""
  )
  description = "The name of the Redis Cache."
}

output "resource_group_name" {
  value = (
    length(azurerm_redis_cache.adl_redis) > 0 ?
    azurerm_redis_cache.adl_redis[0].resource_group_name : ""
  )
  description = "Resource Group where the Redis Cache exists."
}