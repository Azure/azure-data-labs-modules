# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint

resource "azurerm_private_endpoint" "adl_pe" {
  name                = "pe-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-${var.basename}"
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = var.subresource_names
    is_manual_connection           = var.is_manual_connection
  }
  private_dns_zone_group {
    name                 = "pdnszg-${var.basename}"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  tags = var.tags

  count = var.module_enabled ? 1 : 0
}