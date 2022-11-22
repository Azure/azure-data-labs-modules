locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "key-vault"
    Toolkit = "Terraform"
  }

  dns_kv_vault = "privatelink.vaultcore.azure.net"
}