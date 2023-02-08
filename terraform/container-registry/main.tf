# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_container_registry" "adl_cr" {
  name                          = "cr${var.basename}"
  resource_group_name           = var.rg_name
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.is_sec_module ? false : true
  network_rule_set {
    default_action = var.firewall_default_action
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "cr_pe" {
  name                = "pe-${azurerm_container_registry.adl_cr.name}-acr"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-acr-${var.basename}"
    private_connection_resource_id = azurerm_container_registry.adl_cr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-acr"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}