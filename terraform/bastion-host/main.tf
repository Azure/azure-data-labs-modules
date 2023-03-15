# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host

resource "azurerm_bastion_host" "adl_bas" {
  name                = "bas-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  copy_paste_enabled  = var.copy_paste_enabled
  file_copy_enabled   = var.file_copy_enabled
  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.adl_pip[0].id
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_public_ip" "adl_pip" {
  name                = "pip-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags

  count = var.module_enabled ? 1 : 0
}