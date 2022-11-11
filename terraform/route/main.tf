# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route

resource "azurerm_route" "adl_r" {
  name                = var.name
  resource_group_name = var.rg_name

  route_table_name = var.route_table_name
  address_prefix   = var.address_prefix
  next_hop_type    = var.next_hop_type
}