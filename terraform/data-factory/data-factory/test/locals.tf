locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "data-factory"
    Toolkit = "Terraform"
  }

  dns_adf_df     = "privatelink.datafactory.azure.net"
  dns_adf_portal = "privatelink.adf.azure.com"
}