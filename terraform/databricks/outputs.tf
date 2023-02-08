output "id" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].id : ""
  )
}

output "workspace_url" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].workspace_url : ""
  )
}

output "name" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].name : ""
  )
}

output "resource_group_name" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].resource_group_name : ""
  )
}
