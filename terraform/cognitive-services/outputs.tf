output "id" {
  value = (
    length(azurerm_cognitive_account.adl_cog) > 0 ?
    azurerm_cognitive_account.adl_cog[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_cognitive_account.adl_cog) > 0 ?
    azurerm_cognitive_account.adl_cog[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_cognitive_account.adl_cog) > 0 ?
    azurerm_cognitive_account.adl_cog[0].resource_group_name : ""
  )
}