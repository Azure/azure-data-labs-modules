module "event_grid_domain" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/event-grid/event-grid-domain"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.ev_domain.id]

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "ev_domain" {
  name                = local.dns_ev_domain
  resource_group_name = var.rg_name_dns
}