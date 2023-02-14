output "id" {
  value = (
    length(azurerm_firewall.adl_afw) > 0 ?
    azurerm_firewall.adl_afw[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_firewall.adl_afw) > 0 ?
    azurerm_firewall.adl_afw[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_firewall.adl_afw) > 0 ?
    azurerm_firewall.adl_afw[0].resource_group_name : ""
  )
}