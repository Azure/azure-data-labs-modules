output "id" {
  value = (
    length(azurerm_purview_account.adl_pview) > 0 ?
    azurerm_purview_account.adl_pview[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_purview_account.adl_pview) > 0 ?
    azurerm_purview_account.adl_pview[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_purview_account.adl_pview) > 0 ?
    azurerm_purview_account.adl_pview[0].resource_group_name : ""
  )
}