locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "synapse-workspace"
    Toolkit = "Terraform"
  }

  dns_st_blob = "privatelink.blob.core.windows.net"

  dns_st_dfs = "privatelink.dfs.core.windows.net"

  dns_syn_sql = "privatelink.sql.azuresynapse.net"

  dns_syn_dev = "privatelink.dev.azuresynapse.net"
}