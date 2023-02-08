# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_cognitive_account" "adl_cog" {
  name                               = "cog-${var.basename}"
  location                           = var.location
  resource_group_name                = var.rg_name
  kind                               = var.kind
  sku_name                           = var.sku_name
  custom_subdomain_name              = "cog-${var.basename}"
  public_network_access_enabled      = var.is_sec_module ? false : true
  outbound_network_access_restricted = var.is_sec_module ? true : false
  # network_acls {
  #   default_action = "Deny"
  #   ip_rules       = []
  #   /* virtual_network_rules {

  #   } */
  # }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "cog_pe" {
  name                = "pe-${azurerm_cognitive_account.adl_cog.name}-cog"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-cog-${var.basename}"
    private_connection_resource_id = azurerm_cognitive_account.adl_cog.id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-cog"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}