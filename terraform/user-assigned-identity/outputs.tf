output "id" {
  value = (
    length(azurerm_user_assigned_identity.adl_id) > 0 ?
    azurerm_user_assigned_identity.adl_id[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_user_assigned_identity.adl_id) > 0 ?
    azurerm_user_assigned_identity.adl_id[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_user_assigned_identity.adl_id) > 0 ?
    azurerm_user_assigned_identity.adl_id[0].resource_group_name : ""
  )
}

output "principal_id" {
  value = (
    length(azurerm_user_assigned_identity.adl_id) > 0 ?
    azurerm_user_assigned_identity.adl_id[0].principal_id : ""
  )
}