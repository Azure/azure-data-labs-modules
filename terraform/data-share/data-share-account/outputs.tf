output "id" {
  value = (
    length(azurerm_data_share_account.adl_dsa) > 0 ?
    azurerm_data_share_account.adl_dsa[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_data_share_account.adl_dsa) > 0 ?
    azurerm_data_share_account.adl_dsa[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_data_share_account.adl_dsa) > 0 ?
    azurerm_data_share_account.adl_dsa[0].resource_group_name : ""
  )
}

output "identity" {
  value = (
    length(azurerm_data_share_account.adl_dsa) > 0 ?
    azurerm_data_share_account.adl_dsa[0].identity : [{}]
  )
}
