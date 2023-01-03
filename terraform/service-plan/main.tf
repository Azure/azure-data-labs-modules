# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan

resource "azurerm_service_plan" "adl_sp" {
  name                = "sp-${var.basename}"
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name

  tags = var.tags
}