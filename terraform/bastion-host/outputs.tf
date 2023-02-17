output "id" {
  value = (
    length(azurerm_bastion_host.adl_bas) > 0 ?
    azurerm_bastion_host.adl_bas[0].id : ""
  )
  description = "Resource identifier of the instance of Bastion Host."
}

output "name" {
  value = (
    length(azurerm_bastion_host.adl_bas) > 0 ?
    azurerm_bastion_host.adl_bas[0].name : ""
  )
  description = "The name of the Bastion Host."
}

output "resource_group_name" {
  value = (
    length(azurerm_bastion_host.adl_bas) > 0 ?
    azurerm_bastion_host.adl_bas[0].resource_group_name : ""
  )
  description = "Resource Group where the Bastion Host exists."
}