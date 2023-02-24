locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "bastion-host"
    Toolkit = "Terraform"
  }

  snet_name = "AzureBastionSubnet"

  vnet_name = "vnet-adl-modules-test"
}