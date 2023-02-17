output "id" {
  value = (
    length(azurerm_data_factory.adl_adf) > 0 ?
    azurerm_data_factory.adl_adf[0].id : ""
  )
  description = "Resource identifier of the instance of Azure Data Factory."
}

output "name" {
  value = (
    length(azurerm_data_factory.adl_adf) > 0 ?
    azurerm_data_factory.adl_adf[0].name : ""
  )
  description = "The name of the Azure Data Factory."
}

output "resource_group_name" {
  value = (
    length(azurerm_data_factory.adl_adf) > 0 ?
    azurerm_data_factory.adl_adf[0].resource_group_name : ""
  )
  description = "Resource Group where the Azure Data Factory exists."
}