locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "private-endpoint"
    Toolkit = "Terraform"
  }

  dns_kv_vault = "privatelink.vaultcore.azure.net"
}