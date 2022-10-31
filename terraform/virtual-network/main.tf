# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "adl_vnet" {
  name                = "vnet-${var.basename}"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.rg_name

  tags = var.tags
}