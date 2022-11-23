locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "synapse-private-link-hub"
    Toolkit = "Terraform"
  }

  dns_syn_web = "privatelink.azuresynapse.net"
}