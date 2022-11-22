locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "event-grid-domain"
    Toolkit = "Terraform"
  }

  dns_ev_domain = "privatelink.eventgrid.azure.net"
}