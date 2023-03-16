# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/powerbi_embedded

resource "azurerm_powerbi_embedded" "adl_pbi" {
  name                = "pbi${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  administrators      = var.administrators
  mode                = var.mode
  tags                = var.tags

  count = var.module_enabled ? 1 : 0
}