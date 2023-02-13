output "id" {
  value = (
    length(azurerm_data_share.adl_ds) > 0 ?
    azurerm_data_share.adl_ds[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_data_share.adl_ds) > 0 ?
    azurerm_data_share.adl_ds[0].name : ""
  )
}