output "id" {
  value = (
    length(azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir) > 0 ?
    azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir[0].id : ""
  )
  description = "Resource identifier of the instance of Self Hosted Integration Runtime."
}

output "name" {
  value = (
    length(azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir) > 0 ?
    azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir[0].name : ""
  )
  description = "The name of the Self Hosted Integration Runtime."
}

output "resource_group_name" {
  value = (
    length(module.virtual_machine) > 0 ?
    module.virtual_machine[0].resource_group_name : ""
  )
  description = "Resource Group where the Self Hosted Integration Runtime exists."
}

output "primary_authorization_key" {
  value = (
    length(azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir) > 0 ?
    azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir[0].primary_authorization_key : ""
  )
  description = "Primary authorization key of the Self Hosted Integration Runtime."
  sensitive   = true
}