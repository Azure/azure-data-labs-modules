locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "databricks-workspace"
    Toolkit = "Terraform"
  }

  dns_databricks = "privatelink.azuredatabricks.net"
  dns_dbfs_dfs   = "privatelink.dfs.core.windows.net"
  dns_key_vault  = "privatelink.vaultcore.azure.net"
}