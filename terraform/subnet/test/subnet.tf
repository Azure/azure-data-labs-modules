module "subnet" {
  source = "../"

  rg_name = var.rg_name
  name    = "snet-test"

  vnet_name        = data.azurerm_virtual_network.vnet_default.name
  address_prefixes = ["10.0.3.0/27"]
}

# Data dependencies

data "azurerm_virtual_network" "vnet_default" {
  name                = local.vnet_name
  resource_group_name = var.rg_name
}