output "id" {
  value = (
    length(azurerm_network_security_rule.adl_nsgsr) > 0 ?
    azurerm_network_security_rule.adl_nsgsr[0].id : ""
  )
  description = "Resource identifier of the instance of Network Security rule."
}

output "name" {
  value = (
    length(azurerm_network_security_rule.adl_nsgsr) > 0 ?
    azurerm_network_security_rule.adl_nsgsr[0].name : ""
  )
  description = "The name of the Network Security rule."
}