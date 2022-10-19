# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table

resource "azurerm_route_table" "adl_rt" {
  name                = "rt-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name

  tags = var.tags
}  