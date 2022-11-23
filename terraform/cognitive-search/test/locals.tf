locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cognitive-search"
    Toolkit = "Terraform"
  }

  snet_name     = "snet-adl-modules-test-default"
  vnet_name     = "vnet-adl-modules-test"
  dns_cs_search = "privatelink.search.windows.net"
}