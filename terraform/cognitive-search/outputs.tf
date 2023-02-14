output "id" {
  value = (
    length(azurerm_search_service.adl_srch) > 0 ?
    azurerm_search_service.adl_srch[0].id : ""
  )
  description = "Resource identifier of the instance of Cognitive Search."
}

output "name" {
  value = (
    length(azurerm_search_service.adl_srch) > 0 ?
    azurerm_search_service.adl_srch[0].name : ""
  )
  description = "The name of the Cognitive Search."
}

output "resource_group_name" {
  value = (
    length(azurerm_search_service.adl_srch) > 0 ?
    azurerm_search_service.adl_srch[0].resource_group_name : ""
  )
  description = "Resource Group where the Cognitive Search exists."
}