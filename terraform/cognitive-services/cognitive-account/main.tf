# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_cognitive_account" "adl_cog_acc" {
  name                               = "cog-${var.basename}"
  location                           = var.location
  resource_group_name                = var.resource_group_name
  kind                               = var.kind
  sku_name                           = var.sku_name
  custom_subdomain_name              = "cog-${var.basename}"
  public_network_access_enabled      = var.public_network_access_enabled
  outbound_network_access_restricted = var.outbound_network_access_restricted
  # network_acls {
  #   default_action = "Deny"
  #   ip_rules       = []
  #   /* virtual_network_rules {

  #   } */
  # }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

module "cog_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_cognitive_account.adl_cog_acc[0].name}-cog"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_cognitive_account.adl_cog_acc[0].id
  subresource_names              = ["account"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}