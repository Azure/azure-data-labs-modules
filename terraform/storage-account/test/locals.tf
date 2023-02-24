locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "storage-account"
    Toolkit = "Terraform"
  }

  dns_st_blob = "privatelink.blob.core.windows.net"

  dns_st_file = "privatelink.file.core.windows.net"

  dns_st_dfs = "privatelink.dfs.core.windows.net"
}