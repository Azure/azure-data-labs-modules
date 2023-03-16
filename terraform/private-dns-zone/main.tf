# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone

resource "azurerm_private_dns_zone" "adl_pdnsz" {
  for_each            = var.dns_zones
  name                = each.value
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link-ex" {
  for_each              = azurerm_private_dns_zone.adl_pdnsz
  name                  = "${each.value.name}-vnetlink"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = each.value.name
  virtual_network_id    = var.vnet_id
  depends_on = [
    azurerm_private_dns_zone.adl_pdnsz
  ]
}