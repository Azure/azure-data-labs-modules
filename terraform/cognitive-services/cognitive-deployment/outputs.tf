output "id" {
  value = (
    length(azurerm_cognitive_deployment.adl_cog) > 0 ?
    azurerm_cognitive_deployment.adl_cog[0].id : ""
  )
  description = "Resource identifier of the instance of Cognitive Deployment."
}

output "name" {
  value = (
    length(azurerm_cognitive_deployment.adl_cog) > 0 ?
    azurerm_cognitive_deployment.adl_cog[0].name : ""
  )
  description = "The name of the Cognitive Deployment."
}

output "resource_group_name" {
  value = (
    length(azurerm_cognitive_deployment.adl_cog) > 0 ?
    azurerm_cognitive_deployment.adl_cog[0].resource_group_name : ""
  )
  description = "Resource Group where the Cognitive Deployment exists."
}