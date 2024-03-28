output "id" {
  value = module.databricks.id
}

output "workspace_url" {
  value = module.databricks.workspace_url
}

output "name" {
  value = module.databricks.name
}

output "resource_group_name" {
  value = module.databricks.resource_group_name
}

output "cmk_id" {
  value = azurerm_databricks_workspace_root_dbfs_customer_managed_key.adl_adb_ws_cmk.id
}