output "id" {
  value = (
    length(azurerm_analysis_services_server.adl_as) > 0 ?
    azurerm_analysis_services_server.adl_as[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_analysis_services_server.adl_as) > 0 ?
    azurerm_analysis_services_server.adl_as[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_analysis_services_server.adl_as) > 0 ?
    azurerm_analysis_services_server.adl_as[0].resource_group_name : ""
  )
}