locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cognitive-deployment"
    Toolkit = "Terraform"
  }

  dns_cog = "privatelink.cognitiveservices.azure.com"
}