output "id" {
  value = (
    length(azurerm_network_security_rule.adl_nsgsr) > 0 ?
    azurerm_network_security_rule.adl_nsgsr[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_network_security_rule.adl_nsgsr) > 0 ?
    azurerm_network_security_rule.adl_nsgsr[0].name : ""
  )
}