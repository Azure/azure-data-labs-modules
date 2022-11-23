locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "service-bus-namespace"
    Toolkit = "Terraform"
  }

  dns_sb_namespace = "privatelink.servicebus.windows.net"
}