locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "batch-services/account"
    Toolkit = "Terraform"
  }

  dns_batch = "privatelink.batchservices.azure.com"
}