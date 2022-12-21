output "id" {
  value = module.databricks.id
}

output "workspace_url" {
  value = azurerm_databricks_workspace.adl_databricks.workspace_url
}