# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_topic

resource "azurerm_eventgrid_topic" "adl_evgt" {
  name                          = "evgt-${var.basename}"
  location                      = var.location
  resource_group_name           = var.rg_name
  input_schema                  = var.input_schema
  public_network_access_enabled = var.is_sec_module ? false : true
  local_auth_enabled            = var.local_auth_enabled
  tags                          = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "evgt_pe" {
  name                = "pe-${azurerm_eventgrid_topic.adl_evgt[0].name}-topic"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-evgt-${var.basename}"
    private_connection_resource_id = azurerm_eventgrid_topic.adl_evgt[0].id
    subresource_names              = ["topic"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-evgt"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}