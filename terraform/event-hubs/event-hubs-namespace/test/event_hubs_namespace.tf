module "event_hubs_namespace" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/event-hubs/event-hubs-namespace"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.ev_namespace.id]

  module_enabled = true

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "ev_namespace" {
  name                = local.dns_ev_namespace
  resource_group_name = var.rg_name_dns
}