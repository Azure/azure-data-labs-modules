output "id" {
  value = (
    length(azurerm_bastion_host.adl_bas) > 0 ?
    azurerm_bastion_host.adl_bas[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_bastion_host.adl_bas) > 0 ?
    azurerm_bastion_host.adl_bas[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_bastion_host.adl_bas) > 0 ?
    azurerm_bastion_host.adl_bas[0].resource_group_name : ""
  )
}