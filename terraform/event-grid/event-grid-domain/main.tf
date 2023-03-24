# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_domain

resource "azurerm_eventgrid_domain" "adl_evgd" {
  name                                      = "evgd-${var.basename}"
  location                                  = var.location
  resource_group_name                       = var.resource_group_name
  input_schema                              = var.input_schema
  public_network_access_enabled             = var.public_network_access_enabled
  local_auth_enabled                        = var.local_auth_enabled
  auto_create_topic_with_first_subscription = var.auto_create_topic_with_first_subscription
  auto_delete_topic_with_last_subscription  = var.auto_delete_topic_with_last_subscription
  tags                                      = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

module "evgd_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_eventgrid_domain.adl_evgd[0].name}-domain"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_eventgrid_domain.adl_evgd[0].id
  subresource_names              = ["domain"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}