output "id" {
  value = (
    length(azurerm_key_vault.adl_kv) > 0 ?
    azurerm_key_vault.adl_kv[0].id : ""
  )
}

output "name" {
  value = (
    length(azurerm_key_vault.adl_kv) > 0 ?
    azurerm_key_vault.adl_kv[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_key_vault.adl_kv) > 0 ?
    azurerm_key_vault.adl_kv[0].resource_group_name : ""
  )
}