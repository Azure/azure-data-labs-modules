output "id" {
  value = (
    length(azurerm_key_vault.adl_kv) > 0 ?
    azurerm_key_vault.adl_kv[0].id : ""
  )
  description = "Resource identifier of the instance of Azure Key Vault."
}

output "name" {
  value = (
    length(azurerm_key_vault.adl_kv) > 0 ?
    azurerm_key_vault.adl_kv[0].name : ""
  )
  description = "The name of the Azure Key Vault."
}

output "resource_group_name" {
  value = (
    length(azurerm_key_vault.adl_kv) > 0 ?
    azurerm_key_vault.adl_kv[0].resource_group_name : ""
  )
  description = "Resource Group where the Azure Key Vault exists."
}


output "data_client_id" {
  value = data.azurerm_client_config.current.client_id
}
output "data_object_id" {
  value = data.azurerm_client_config.current.object_id
}
output "data_id" {
  value = data.azurerm_client_config.current.id
}
