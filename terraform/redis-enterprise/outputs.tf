output "id" {
  value = (
    length(azurerm_redis_enterprise_cluster.adl_redis_enterprise) > 0 ?
    azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].id : ""
  )
  description = "Resource identifier of the instance of Redis Enterprise cluster."
}

output "name" {
  value = (
    length(azurerm_redis_enterprise_cluster.adl_redis_enterprise) > 0 ?
    azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].name : ""
  )
  description = "The name of the Redis Enterprise cluster."
}

output "hostname" {
  value = (
    length(azurerm_redis_enterprise_cluster.adl_redis_enterprise) > 0 ?
    azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].hostname : ""
  )
  description = "The FQDN name of the host for the Redis Enterprise cluster."
}

output "resource_group_name" {
  value = (
    length(azurerm_redis_enterprise_cluster.adl_redis_enterprise) > 0 ?
    azurerm_redis_enterprise_cluster.adl_redis_enterprise[0].resource_group_name : ""
  )
  description = "Resource Group where the Redis Enterprise cluster exists."
}

output "port" {
  value       = 10000
  description = "Port number on which the default database is listening on."
}

output "primary_access_key" {
  value = (
    length(azurerm_redis_enterprise_database.adl_redis_database) > 0 ?
    azurerm_redis_enterprise_database.adl_redis_database[0].primary_access_key : ""
  )
  description = "Primary access key for the default database."
  sensitive   = true
}