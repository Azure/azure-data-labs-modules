output "id" {
  value = (
    length(azurerm_user_assigned_identity.adl_id) > 0 ?
    azurerm_user_assigned_identity.adl_id[0].id : ""
  )
  description = "Resource identifier of the instance of User Assigned Identity."
}

output "name" {
  value = (
    length(azurerm_user_assigned_identity.adl_id) > 0 ?
    azurerm_user_assigned_identity.adl_id[0].name : ""
  )
  description = "The name of the User Assigned Identity."
}

output "resource_group_name" {
  value = (
    length(azurerm_user_assigned_identity.adl_id) > 0 ?
    azurerm_user_assigned_identity.adl_id[0].resource_group_name : ""
  )
  description = "Resource Group where the User Assigned Identity exists."
}

output "principal_id" {
  value = (
    length(azurerm_user_assigned_identity.adl_id) > 0 ?
    azurerm_user_assigned_identity.adl_id[0].principal_id : ""
  )
  description = "Identifier of the User Assigned Identity Principal."
}