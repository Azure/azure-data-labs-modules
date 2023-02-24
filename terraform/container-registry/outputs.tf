output "id" {
  value = (
    length(azurerm_container_registry.adl_cr) > 0 ?
    azurerm_container_registry.adl_cr[0].id : ""
  )
  description = "Resource identifier of the instance of Container Registry."
}

output "name" {
  value = (
    length(azurerm_container_registry.adl_cr) > 0 ?
    azurerm_container_registry.adl_cr[0].name : ""
  )
  description = "The name of the Container Registry."
}

output "resource_group_name" {
  value = (
    length(azurerm_container_registry.adl_cr) > 0 ?
    azurerm_container_registry.adl_cr[0].resource_group_name : ""
  )
  description = "Resource Group where the Container Registry exists."
}