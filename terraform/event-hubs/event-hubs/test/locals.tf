locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "event-hubs"
    Toolkit = "Terraform"
  }

  dns_ev_namespace = "privatelink.servicebus.windows.net"
}