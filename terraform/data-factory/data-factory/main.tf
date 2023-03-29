# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory

resource "azurerm_data_factory" "adl_adf" {
  name                = "adf-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name

  identity {
    type = "SystemAssigned"
  }

  public_network_enabled          = var.public_network_access_enabled
  managed_virtual_network_enabled = var.managed_virtual_network_enabled

  count = var.module_enabled ? 1 : 0

  tags = var.tags
}

# Private Endpoint configuration

module "df_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_data_factory.adl_adf[0].name}-df"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_data_factory.adl_adf[0].id
  subresource_names              = ["dataFactory"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids_df
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint

  count = var.module_enabled ? 1 : 0
}

module "portal_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_data_factory.adl_adf[0].name}-portal"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_data_factory.adl_adf[0].id
  subresource_names              = ["portal"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids_portal
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint

  count = var.module_enabled ? 1 : 0
}