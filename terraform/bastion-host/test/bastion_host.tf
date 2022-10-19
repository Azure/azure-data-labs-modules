module "bastion" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/bastion-host"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id = data.azurerm_subnet.snet_bastion.id

  module_enabled = true

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_bastion" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}