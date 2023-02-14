output "id" {
  value = (
    length(azurerm_firewall.adl_afw) > 0 ?
    azurerm_firewall.adl_afw[0].id : ""
  )
  description = "Resource identifier of the instance of Azure Firewall."
}

output "name" {
  value = (
    length(azurerm_firewall.adl_afw) > 0 ?
    azurerm_firewall.adl_afw[0].name : ""
  )
  description = "The name of the Azure Firewall."
}

output "resource_group_name" {
  value = (
    length(azurerm_firewall.adl_afw) > 0 ?
    azurerm_firewall.adl_afw[0].resource_group_name : ""
  )
  description = "Resource Group where the Azure Firewall exists."
}