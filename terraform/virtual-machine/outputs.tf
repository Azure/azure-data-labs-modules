output "id" {
  value = (
    length(azurerm_virtual_machine.adl_vm) > 0 ?
    azurerm_virtual_machine.adl_vm[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_virtual_machine.adl_vm) > 0 ?
    azurerm_virtual_machine.adl_vm[0].name : ""
  )
}