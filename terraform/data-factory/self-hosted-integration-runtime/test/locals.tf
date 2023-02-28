locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "self-hosted-integration-runtime"
    Toolkit = "Terraform"
  }

  dns_adf_df     = "privatelink.datafactory.azure.net"
  dns_adf_portal = "privatelink.adf.azure.com"
  dns_st_blob    = "privatelink.blob.core.windows.net"
}