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

output "identity" {
  value = (
    length(azurerm_virtual_machine.adl_vm) > 0 ?
    azurerm_virtual_machine.adl_vm[0].identity : []
  )
  description = <<EOF
  "
      principal_id - The Principal ID associated with this Managed Service Identity.
      tenant_id - The Tenant ID associated with this Managed Service Identity.
  "
  EOF
}

output "public_ip_address" {
  value = (
    length(azurerm_public_ip.vm_pip) > 0 ?
    azurerm_public_ip.vm_pip[0].ip_address : ""
  )
  description = "Public IP address assigned to the Virtual Machine."
}
