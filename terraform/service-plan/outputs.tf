output "id" {
  value = (
    length(azurerm_service_plan.adl_sp) > 0 ?
    azurerm_service_plan.adl_sp[0].id : ""
  )
  description = "Resource identifier of the instance of Service Plan."
}

output "name" {
  value = (
    length(azurerm_service_plan.adl_sp) > 0 ?
    azurerm_service_plan.adl_sp[0].name : ""
  )
  description = "The name of the Service Plan."
}

output "resource_group_name" {
  value = (
    length(azurerm_service_plan.adl_sp) > 0 ?
    azurerm_service_plan.adl_sp[0].resource_group_name : ""
  )
  description = "Resource Group where the Service Plan exists."
}