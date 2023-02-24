output "id" {
  value = (
    length(azurerm_log_analytics_workspace.adl_log) > 0 ?
    azurerm_log_analytics_workspace.adl_log[0].id : ""
  )
  description = "Resource identifier of the instance of Log Analytics workspace."
}

output "name" {
  value = (
    length(azurerm_log_analytics_workspace.adl_log) > 0 ?
    azurerm_log_analytics_workspace.adl_log[0].name : ""
  )
  description = "The name of the Log Analytics workspace."
}

output "resource_group_name" {
  value = (
    length(azurerm_log_analytics_workspace.adl_log) > 0 ?
    azurerm_log_analytics_workspace.adl_log[0].resource_group_name : ""
  )
  description = "Resource Group where the Log Analytics workspace exists."
}