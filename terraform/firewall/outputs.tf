output "id" {
  value = (
    length(azurerm_firewall.adl_afw) > 0 ?
    azurerm_firewall.adl_afw[0].id : ""
  )
}