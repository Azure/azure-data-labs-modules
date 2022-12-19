output "id" {
  value = (
    length(azurerm_powerbi_embedded.adl_pbi) > 0 ?
    azurerm_powerbi_embedded.adl_pbi[0].id : ""
  )
}