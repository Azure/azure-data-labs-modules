output "id" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].id : null
  )
  description = "Resource identifier of the instance of Azure Databricks."
}

output "workspace_url" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].workspace_url : null
  )
  description = "The URL used to connect to the workspace of the Azure Databricks."
}

output "workspace_id" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].workspace_id : null
  )
  description = "The unique identifier of the databricks workspace in Databricks control plane."
}

output "name" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].name : null
  )
  description = "The name of the instance of Azure Databricks."
}

output "resource_group_name" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].resource_group_name : null
  )
  description = "Resource Group where the instance of Azure Databricks exists."
}

output "managed_resource_group_id" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].managed_resource_group_id : null
  )
  description = "The ID of the Managed Resource Group created by the Databricks Workspace."
}

output "storage_account_identity" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].storage_account_identity : []
  )
  description = "Block exports the principal_id, tenant_id and type of the internal databricks storage account identity for enabling Customer Managed Keys."
}

output "managed_disk_identity" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].managed_disk_identity : []
  )
  description = "Block exports the principal_id, tenant_id and type of the internal databricks disks identity for enabling Customer Managed Keys."
}

output "disk_encryption_set_id" {
  value = (
    length(azurerm_databricks_workspace.adl_databricks) > 0 ?
    azurerm_databricks_workspace.adl_databricks[0].disk_encryption_set_id : null
  )
  description = "The ID of Managed Disk Encryption Set created by the Databricks Workspace."
} 