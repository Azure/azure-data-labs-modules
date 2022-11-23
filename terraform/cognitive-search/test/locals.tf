locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "cognitive-search"
    Toolkit = "Terraform"
  }

  dns_cs_search = "privatelink.search.windows.net"
}