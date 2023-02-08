output "id" {
  value = (
    length(azurerm_service_plan.adl_sp) > 0 ?
    azurerm_service_plan.adl_sp[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_service_plan.adl_sp) > 0 ?
    azurerm_service_plan.adl_sp[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_service_plan.adl_sp) > 0 ?
    azurerm_service_plan.adl_sp[0].resource_group_name : ""
  )
}