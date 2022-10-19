module "synapse_private_link_hub" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/synapse/synapse-private-link-hub"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.syn_web.id]

  module_enabled = true

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "syn_web" {
  name                = local.dns_syn_web
  resource_group_name = var.rg_name_dns
}