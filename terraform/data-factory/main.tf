# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory

resource "azurerm_data_factory" "adl_adf" {
  name                = "adf-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name

  public_network_enabled          = var.is_sec_module ? false : true
  managed_virtual_network_enabled = var.is_sec_module ? true : false

  count = var.module_enabled ? 1 : 0

  tags = var.tags
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "df_pe" {
  name                = "pe-${azurerm_data_factory.adl_adf[0].name}-df"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-df-${var.basename}"
    private_connection_resource_id = azurerm_data_factory.adl_adf[0].id
    subresource_names              = ["dataFactory"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-df"
    private_dns_zone_ids = var.private_dns_zone_ids_df
  }

  count = var.is_sec_module && var.module_enabled ? 1 : 0
}

resource "azurerm_private_endpoint" "portal_pe" {
  name                = "pe-${azurerm_data_factory.adl_adf[0].name}-portal"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-portal-${var.basename}"
    private_connection_resource_id = azurerm_data_factory.adl_adf[0].id
    subresource_names              = ["portal"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-portal"
    private_dns_zone_ids = var.private_dns_zone_ids_portal
  }

  count = var.is_sec_module && var.module_enabled ? 1 : 0

  tags = var.tags
}