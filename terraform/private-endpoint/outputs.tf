output "id" {
  value = (
    length(azurerm_private_endpoint.adl_pe) > 0 ?
    azurerm_private_endpoint.adl_pe[0].id : ""
  )
  description = "Resource identifier of the instance of Private Endpoint."
}

output "name" {
  value = (
    length(azurerm_private_endpoint.adl_pe) > 0 ?
    azurerm_private_endpoint.adl_pe[0].name : ""
  )
  description = "The name of the Private Endpoint."
}

output "resource_group_name" {
  value = (
    length(azurerm_private_endpoint.adl_pe) > 0 ?
    azurerm_private_endpoint.adl_pe[0].resource_group_name : ""
  )
  description = "Resource Group where the Private Endpoint."
}