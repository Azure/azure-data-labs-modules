output "id" {
  value = (
    length(azurerm_storage_account.adl_st) > 0 ?
    azurerm_storage_account.adl_st[0].id : ""
  )
  description = "Resource identifier of the instance of Storage Account."
}

output "name" {
  value = (
    length(azurerm_storage_account.adl_st) > 0 ?
    azurerm_storage_account.adl_st[0].name : ""
  )
  description = "The name of the Storage Account."
}

output "resource_group_name" {
  value = (
    length(azurerm_storage_account.adl_st) > 0 ?
    azurerm_storage_account.adl_st[0].resource_group_name : ""
  )
  description = "Resource Group where the Storage Account exists."
}

output "access_key" {
  value = (
    length(azurerm_storage_account.adl_st) > 0 ?
    azurerm_storage_account.adl_st[0].primary_access_key : ""
  )
  description = "Primary access keyfor the Storage Account."
  sensitive   = true
}

output "adls_id" {
  value = (
    length(azurerm_storage_data_lake_gen2_filesystem.st_adls) > 0 ?
    azurerm_storage_data_lake_gen2_filesystem.st_adls[0].id : ""
  )
  description = "Resource identifier of the ADLS filesystem."
}