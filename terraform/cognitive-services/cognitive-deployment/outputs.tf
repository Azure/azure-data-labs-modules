output "id" {
  value = (
    length(azurerm_cognitive_deployment.adl_cog_dpl) > 0 ?
    azurerm_cognitive_deployment.adl_cog_dpl[0].id : ""
  )
  description = "Resource identifier of the instance of Cognitive Deployment."
}

output "name" {
  value = (
    length(azurerm_cognitive_deployment.adl_cog_dpl) > 0 ?
    azurerm_cognitive_deployment.adl_cog_dpl[0].name : ""
  )
  description = "The name of the Cognitive Deployment."
}