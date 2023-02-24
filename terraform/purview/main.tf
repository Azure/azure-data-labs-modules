# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/purview_account

resource "azurerm_purview_account" "adl_pview" {
  name                        = "pview-${var.basename}"
  resource_group_name         = var.rg_name
  location                    = var.location
  public_network_enabled      = var.is_sec_module ? false : true
  managed_resource_group_name = "${var.rg_name}-pview-managed"
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_private_endpoint" "purview_pe" {
  name                = "pe-${azurerm_purview_account.adl_pview[0].name}-purview"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-purview-${var.basename}"
    private_connection_resource_id = azurerm_purview_account.adl_pview[0].id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-purview"
    private_dns_zone_ids = var.private_dns_zone_ids_account
  }
  tags = var.tags

  count = var.is_sec_module ? 1 : 0
}

resource "azurerm_private_endpoint" "studio_pe" {
  name                = "pe-${azurerm_purview_account.adl_pview[0].name}-studio"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-studio-${var.basename}"
    private_connection_resource_id = azurerm_purview_account.adl_pview[0].id
    subresource_names              = ["portal"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-studio"
    private_dns_zone_ids = var.private_dns_zone_ids_portal
  }
  tags = var.tags

  count = var.is_sec_module ? 1 : 0
}
