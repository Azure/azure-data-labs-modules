locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "container-registry"
    Toolkit = "Terraform"
  }

  dns_cr = "privatelink.azurecr.io"
}