# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_private_link_hub

resource "azurerm_synapse_private_link_hub" "syn_synplh" {
  name                = "synplh${var.basename}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

module "synplh_pe_web" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_synapse_private_link_hub.syn_synplh[0].name}-web"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_synapse_private_link_hub.syn_synplh[0].id
  subresource_names              = ["web"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled

  count = var.module_enabled ? 1 : 0
}