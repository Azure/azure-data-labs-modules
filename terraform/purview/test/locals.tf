locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "purview"
    Toolkit = "Terraform"
  }

  dns_pview_portal = "privatelink.purview.azure.com"

  dns_pview_account = "privatelink.purviewstudio.azure.com"
}