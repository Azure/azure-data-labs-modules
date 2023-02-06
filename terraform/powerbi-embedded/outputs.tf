output "id" {
  value = (
    length(azurerm_powerbi_embedded.adl_pbi) > 0 ?
    azurerm_powerbi_embedded.adl_pbi[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_powerbi_embedded.adl_pbi) > 0 ?
    azurerm_powerbi_embedded.adl_pbi[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_powerbi_embedded.adl_pbi) > 0 ?
    azurerm_powerbi_embedded.adl_pbi[0].resource_group_name : ""
  )
}