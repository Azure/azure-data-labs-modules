output "id" {
  value = (
    length(azurerm_cognitive_account.adl_cog_acc) > 0 ?
    azurerm_cognitive_account.adl_cog_acc[0].id : ""
  )
  description = "Resource identifier of the instance of Cognitive Services."
}

output "name" {
  value = (
    length(azurerm_cognitive_account.adl_cog_acc) > 0 ?
    azurerm_cognitive_account.adl_cog_acc[0].name : ""
  )
  description = "The name of the Cognitive Services."
}

output "resource_group_name" {
  value = (
    length(azurerm_cognitive_account.adl_cog_acc) > 0 ?
    azurerm_cognitive_account.adl_cog_acc[0].resource_group_name : ""
  )
  description = "Resource Group where the Cognitive Services exists."
}