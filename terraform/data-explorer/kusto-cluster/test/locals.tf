locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "kusto-cluster"
    Toolkit = "Terraform"
  }

  dns_dec_cluster = "privatelink.northeurope.kusto.windows.net"
}