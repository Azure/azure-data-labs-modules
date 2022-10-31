# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association

resource "azurerm_subnet_route_table_association" "adl_snet_rt_association" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}