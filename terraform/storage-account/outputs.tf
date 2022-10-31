output "id" {
  value = (
    length(azurerm_storage_account.adl_st) > 0 ?
    azurerm_storage_account.adl_st[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_storage_account.adl_st) > 0 ?
    azurerm_storage_account.adl_st[0].name : ""
  )
}

output "adls_id" {
  value = (
    length(azurerm_storage_account.adl_st) > 0 ?
    azurerm_storage_data_lake_gen2_filesystem.st_adls[0].id : ""
  )
}