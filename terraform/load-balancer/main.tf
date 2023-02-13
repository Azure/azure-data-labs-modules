# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb

resource "azurerm_lb" "adl_lb" {
  name                = "lb-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                 = "pip-${var.basename}"
    public_ip_address_id = azurerm_public_ip.adl_lb_pip[0].id
  }

  count = var.module_enabled ? 1 : 0

  tags = var.tags
}

# Public IP config

resource "azurerm_public_ip" "adl_lb_pip" {
  name                = "pip-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = var.pip_allocation_method
  sku                 = var.pip_sku

  count = var.module_enabled ? 1 : 0

  tags = var.tags
}