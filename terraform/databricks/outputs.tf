output "id" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].id : ""
  )
  description = "Resource identifier of the instance of Azure Databricks."
}

output "workspace_url" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].workspace_url : ""
  )
  description = "The URL used to connect to the workspace of the Azure Databricks."
}

output "name" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].name : ""
  )
  description = "The name of the instance of Azure Databricks."
}

output "resource_group_name" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].resource_group_name : ""
  )
  description = "Resource Group where the instance of Azure Databricks exists."
}
