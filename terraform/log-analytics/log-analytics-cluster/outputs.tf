output "id" {
  value = (
    length(azurerm_log_analytics_cluster.adl_logc) > 0 ?
    azurerm_log_analytics_cluster.adl_logc[0].id : ""
  )
  description = "Resource identifier of the instance of Log Analytics cluster."
}

output "name" {
  value = (
    length(azurerm_log_analytics_cluster.adl_logc) > 0 ?
    azurerm_log_analytics_cluster.adl_logc[0].name : ""
  )
  description = "The name of the Log Analytics cluster."
}

output "resource_group_name" {
  value = (
    length(azurerm_log_analytics_cluster.adl_logc) > 0 ?
    azurerm_log_analytics_cluster.adl_logc[0].resource_group_name : ""
  )
  description = "Resource Group where the Log Analytics cluster exists."
}