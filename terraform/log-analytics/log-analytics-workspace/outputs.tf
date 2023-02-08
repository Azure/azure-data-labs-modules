output "id" {
  value = (
    length(azurerm_log_analytics_workspace.adl_log) > 0 ?
    azurerm_log_analytics_workspace.adl_log[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_log_analytics_workspace.adl_log) > 0 ?
    azurerm_log_analytics_workspace.adl_log[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_log_analytics_workspace.adl_log) > 0 ?
    azurerm_log_analytics_workspace.adl_log[0].resource_group_name : ""
  )
}