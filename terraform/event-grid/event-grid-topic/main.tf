# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_topic

resource "azurerm_eventgrid_topic" "adl_evgt" {
  name                          = "evgt-${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  input_schema                  = var.input_schema
  public_network_access_enabled = var.public_network_access_enabled ? false : true
  local_auth_enabled            = var.local_auth_enabled
  tags                          = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

module "evgt_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_eventgrid_topic.adl_evgt[0].name}-topic"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_eventgrid_topic.adl_evgt[0].id
  subresource_names              = ["topic"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}