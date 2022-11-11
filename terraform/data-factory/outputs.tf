output "id" {
  value = (
    length(azurerm_data_factory.adl_adf) > 0 ?
    azurerm_data_factory.adl_adf[0].id : ""
  )
}