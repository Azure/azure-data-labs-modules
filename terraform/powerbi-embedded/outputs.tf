output "id" {
  value = (
    length(azurerm_powerbi_embedded.adl_pbi) > 0 ?
    azurerm_powerbi_embedded.adl_pbi[0].id : ""
  )
  description = "Resource identifier of the instance of Power BI Embedded."
}

output "name" {
  value = (
    length(azurerm_powerbi_embedded.adl_pbi) > 0 ?
    azurerm_powerbi_embedded.adl_pbi[0].name : ""
  )
  description = "The name of the Power BI Embedded."
}

output "resource_group_name" {
  value = (
    length(azurerm_powerbi_embedded.adl_pbi) > 0 ?
    azurerm_powerbi_embedded.adl_pbi[0].resource_group_name : ""
  )
  description = "Resource Group where the Power BI Embedded exists."
}