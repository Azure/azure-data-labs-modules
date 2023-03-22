# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/purview_account

resource "azurerm_purview_account" "adl_pview" {
  name                        = "pview-${var.basename}"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  public_network_enabled      = var.public_network_enabled
  managed_resource_group_name = "${var.resource_group_name}-pview-managed"
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

module "purview_pe" {
  source                         = "../private-endpoint"
  basename                       = "${azurerm_purview_account.adl_pview[0].name}-purview"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_purview_account.adl_pview[0].id
  subresource_names              = ["account"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids_account
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}

module "studio_pe" {
  source                         = "../private-endpoint"
  basename                       = "${azurerm_purview_account.adl_pview[0].name}-studio"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_purview_account.adl_pview[0].id
  subresource_names              = ["portal"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids_portal
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}
