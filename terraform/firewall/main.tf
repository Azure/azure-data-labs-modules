# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall

resource "azurerm_firewall" "adl_afw" {
  name                = "afw-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier

  #   ip_configuration {
  #     name                 = "configuration"
  #     subnet_id            = var.subnet_id
  #     public_ip_address_id = azurerm_public_ip.adl_afw_pip[0].id
  #   }

  count = var.module_enabled ? 1 : 0
  tags  = var.tags
}

# Public IP for the firewall

# resource "azurerm_public_ip" "adl_afw_pip" {
#   name                = "pip-${var.basename}"
#   location            = var.location
#   resource_group_name = var.rg_name
#   allocation_method   = var.pip_allocation_method #"Static"
#   sku                 = var.pip_sku               #"Standard"

#   tags  = var.tags
#   count = var.module_enabled ? 1 : 0
# }
