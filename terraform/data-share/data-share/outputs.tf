output "id" {
  value = (
    length(azurerm_data_share.adl_ds) > 0 ?
    azurerm_data_share.adl_ds[0].id : ""
  )
  description = "Resource identifier of the instance of Data Share."
}

output "name" {
  value = (
    length(azurerm_data_share.adl_ds) > 0 ?
    azurerm_data_share.adl_ds[0].name : ""
  )
  description = "The name of the Data Share."
}