output "id" {
  value = (
    length(azurerm_virtual_machine.adl_vm) > 0 ?
    azurerm_virtual_machine.adl_vm[0].id : ""
  )
  description = "Resource identifier of the instance of Virtual Machine."
}

output "name" {
  value = (
    length(azurerm_virtual_machine.adl_vm) > 0 ?
    azurerm_virtual_machine.adl_vm[0].name : ""
  )
  description = "The name of the Virtual Machine."
}

output "resource_group_name" {
  value = (
    length(azurerm_virtual_machine.adl_vm) > 0 ?
    azurerm_virtual_machine.adl_vm[0].resource_group_name : ""
  )
  description = "Resource Group where the Virtual Machine exists."
}