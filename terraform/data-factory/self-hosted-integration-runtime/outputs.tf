/*
output "id" {
  value = (
    length(azurerm_data_factory.adl_adf) > 0 ?
    azurerm_data_factory.adl_adf[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_data_factory.adl_adf) > 0 ?
    azurerm_data_factory.adl_adf[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_data_factory.adl_adf) > 0 ?
    azurerm_data_factory.adl_adf[0].resource_group_name : ""
  )
}
*/