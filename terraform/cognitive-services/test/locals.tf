locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cognitive-services"
    Toolkit = "Terraform"
  }

  dns_cog   = "privatelink.cognitiveservices.azure.com"
}