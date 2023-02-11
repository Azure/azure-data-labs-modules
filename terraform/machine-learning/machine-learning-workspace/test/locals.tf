locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "machine-learning-workspace"
    Toolkit = "Terraform"
  }

  dns_mlw_api = "privatelink.api.azureml.ms"

  dns_mlw_notebooks = "privatelink.notebooks.azure.net"
}