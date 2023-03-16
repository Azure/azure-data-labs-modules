# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group

resource "azurerm_network_security_group" "adl_nsg" {
  name                = "nsg-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  count = var.module_enabled ? 1 : 0
}