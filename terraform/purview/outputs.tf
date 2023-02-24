output "id" {
  value = (
    length(azurerm_purview_account.adl_pview) > 0 ?
    azurerm_purview_account.adl_pview[0].id : ""
  )
  description = "Resource identifier of the instance of Purview."
}

output "name" {
  value = (
    length(azurerm_purview_account.adl_pview) > 0 ?
    azurerm_purview_account.adl_pview[0].name : ""
  )
  description = "The name of the Purview."
}

output "resource_group_name" {
  value = (
    length(azurerm_purview_account.adl_pview) > 0 ?
    azurerm_purview_account.adl_pview[0].resource_group_name : ""
  )
  description = "Resource Group where the Purview exists."
}