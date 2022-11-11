# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_domain

resource "azurerm_eventgrid_domain" "adl_evgd" {
  name                = "evgd-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name

  input_schema = var.input_schema

  public_network_access_enabled = var.is_sec_module ? false : true
  local_auth_enabled            = var.local_auth_enabled

  auto_create_topic_with_first_subscription = var.auto_create_topic_with_first_subscription
  auto_delete_topic_with_last_subscription  = var.auto_delete_topic_with_last_subscription

  tags = var.tags
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "evgd_pe" {
  name                = "pe-${azurerm_eventgrid_domain.adl_evgd.name}-domain"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-evgd-${var.basename}"
    private_connection_resource_id = azurerm_eventgrid_domain.adl_evgd.id
    subresource_names              = ["domain"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-evgd"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module ? 1 : 0

  tags = var.tags
}