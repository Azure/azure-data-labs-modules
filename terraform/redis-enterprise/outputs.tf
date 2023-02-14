output "id" {
  value = (
    length(azurerm_redis_enterprise_cluster.adl_redis_enterprise) > 0 ?
    azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_redis_enterprise_cluster.adl_redis_enterprise) > 0 ?
    azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].name : ""
  )
}

output "hostname" {
  value = (
    length(azurerm_redis_enterprise_cluster.adl_redis_enterprise) > 0 ?
    azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].hostname : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_redis_enterprise_cluster.adl_redis_enterprise) > 0 ?
    azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].resource_group_name : ""
  )
}

output "port" {
  value = 10000
}

output "primary_access_key" {
  value = (
    length(azurerm_redis_enterprise_database.adl_redis_database) > 0 ?
    azurerm_redis_enterprise_database.adl_redis_database[0].primary_access_key : ""
  )
  sensitive = true
}