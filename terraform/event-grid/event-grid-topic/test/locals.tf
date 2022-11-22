locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "event-grid-topic"
    Toolkit = "Terraform"
  }

  dns_ev_topic = "privatelink.eventgrid.azure.net"
}