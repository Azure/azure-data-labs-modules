output "id" {
  value = (
    length(azurerm_batch_account.adl_batch_account) > 0 ?
    azurerm_batch_account.adl_batch_account[0].id : ""
  )
  description = "Resource identifier of the instance of Batch Services Account."
}

output "name" {
  value = (
    length(azurerm_batch_account.adl_batch_account) > 0 ?
    azurerm_batch_account.adl_batch_account[0].name : ""
  )
  description = "The name of the Batch Services Account."
}

output "resource_group_name" {
  value = (
    length(azurerm_batch_account.adl_batch_account) > 0 ?
    azurerm_batch_account.adl_batch_account[0].resource_group_name : ""
  )
  description = "Resource Group where the Batch Services Account exists."
}
