output "id" {
  value = (
    length(azurerm_redis_cache.adl_redis) > 0 ?
    azurerm_redis_cache.adl_redis[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_redis_cache.adl_redis) > 0 ?
    azurerm_redis_cache.adl_redis[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_redis_cache.adl_redis) > 0 ?
    azurerm_redis_cache.adl_redis[0].resource_group_name : ""
  )
}