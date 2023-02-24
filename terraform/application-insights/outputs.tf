output "id" {
  value = (
    length(azurerm_application_insights.adl_appi) > 0 ?
    azurerm_application_insights.adl_appi[0].id : ""
  )
  description = "Resource identifier of the instance of Application Insights."
}

output "instrumentation_key" {
  value = (
    length(azurerm_application_insights.adl_appi) > 0 ?
    azurerm_application_insights.adl_appi[0].instrumentation_key : ""
  )
  description = "The instrumentation key for this instance of Application Insights."
  sensitive   = true
}

output "name" {
  value = (
    length(azurerm_application_insights.adl_appi) > 0 ?
    azurerm_application_insights.adl_appi[0].name : ""
  )
  description = "The name of the Application Insights."
}

output "resource_group_name" {
  value = (
    length(azurerm_application_insights.adl_appi) > 0 ?
    azurerm_application_insights.adl_appi[0].resource_group_name : ""
  )
  description = "Resource Group where the Application Insights exists."
}