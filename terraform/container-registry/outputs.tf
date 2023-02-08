output "id" {
  value = (
    length(azurerm_container_registry.adl_cr) > 0 ?
    azurerm_container_registry.adl_cr[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_container_registry.adl_cr) > 0 ?
    azurerm_container_registry.adl_cr[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_container_registry.adl_cr) > 0 ?
    azurerm_container_registry.adl_cr[0].resource_group_name : ""
  )
}