output "id" {
  value = (
    length(azurerm_data_share_account.adl_dsa) > 0 ?
    azurerm_data_share_account.adl_dsa[0].id : ""
  )
  description = "Resource identifier of the instance of Data Share account."
}

output "name" {
  value = (
    length(azurerm_data_share_account.adl_dsa) > 0 ?
    azurerm_data_share_account.adl_dsa[0].name : ""
  )
  description = "The name of the Data Share account."
}

output "resource_group_name" {
  value = (
    length(azurerm_data_share_account.adl_dsa) > 0 ?
    azurerm_data_share_account.adl_dsa[0].resource_group_name : ""
  )
  description = "Resource Group where the Data Share account exists."
}

output "identity" {
  value = (
    length(azurerm_data_share_account.adl_dsa) > 0 ?
    azurerm_data_share_account.adl_dsa[0].identity : [{}]
  )
  description = "Principal ID and Tenant ID for the Service Principal associated with the identity of the Data Share account."
}