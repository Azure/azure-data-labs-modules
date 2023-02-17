output "id" {
  value = (
    length(azurerm_analysis_services_server.adl_as) > 0 ?
    azurerm_analysis_services_server.adl_as[0].id : ""
  )
  description = "Resource identifier of the instance of Analysis Services Server."
}

output "name" {
  value = (
    length(azurerm_analysis_services_server.adl_as) > 0 ?
    azurerm_analysis_services_server.adl_as[0].name : ""
  )
  description = "The name of the Analysis Services Server."
}

output "resource_group_name" {
  value = (
    length(azurerm_analysis_services_server.adl_as) > 0 ?
    azurerm_analysis_services_server.adl_as[0].resource_group_name : ""
  )
  description = "Resource Group where the Analysis Services Server exists."
}