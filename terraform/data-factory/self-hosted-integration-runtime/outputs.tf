output "id" {
  value = (
    length(azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir) > 0 ?
    azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir) > 0 ?
    azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(module.virtual_machine) > 0 ?
    module.virtual_machine[0].resource_group_name : ""
  )
}

output "primary_authorization_key" {
  value = (
    length(azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir) > 0 ?
    azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir[0].primary_authorization_key : ""
  )
}