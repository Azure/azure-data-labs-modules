# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_private_link_hub

locals {
  safe_basename = replace(var.basename, "-", "")
}

resource "azurerm_synapse_private_link_hub" "syn_synplh" {
  name                = "synplh${local.safe_basename}"
  resource_group_name = var.rg_name
  location            = var.location

  count = var.is_sec_module && var.module_enabled ? 1 : 0

  tags = var.tags
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "synplh_pe_web" {
  name                = "pe-${azurerm_synapse_private_link_hub.syn_synplh[0].name}-web"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-web-${var.basename}"
    private_connection_resource_id = azurerm_synapse_private_link_hub.syn_synplh[0].id
    subresource_names              = ["web"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-syn-web"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module && var.module_enabled ? 1 : 0

  tags = var.tags
}