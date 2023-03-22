# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_container_registry" "adl_cr" {
  name                          = "cr${var.basename}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  network_rule_set {
    default_action = var.firewall_default_action
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

module "cr_pe" {
  source                         = "../private-endpoint"
  basename                       = "${azurerm_container_registry.adl_cr[0].name}-acr"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_container_registry.adl_cr[0].id
  subresource_names              = ["registry"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}