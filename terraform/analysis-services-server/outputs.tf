output "id" {
  value = (
    length(azurerm_analysis_services_server.adl_as) > 0 ?
    azurerm_analysis_services_server.adl_as[0].id : ""
  )
}