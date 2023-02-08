output "id" {
  value = (
    length(azurerm_subnet.adl_snet) > 0 ?
    azurerm_subnet.adl_snet[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_subnet.adl_snet) > 0 ?
    azurerm_subnet.adl_snet[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_subnet.adl_snet) > 0 ?
    azurerm_subnet.adl_snet[0].resource_group_name : ""
  )
}