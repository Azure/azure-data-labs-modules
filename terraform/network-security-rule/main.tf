# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule

resource "azurerm_network_security_rule" "adl_nsgsr" {
  name                        = var.name
  priority                    = var.priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.source_port_range
  destination_port_range      = var.destination_port_range
  source_address_prefix       = length(var.source_address_prefixes) == 0 ? len(var.source_address_prefix) > 0 ? var.source_address_prefix : "" : ""
  source_address_prefixes     = length(var.source_address_prefixes) > 0 ? len(var.source_address_prefix) == 0 ? var.source_address_prefixes : "" : ""
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name

  count = var.module_enabled ? 1 : 0
}