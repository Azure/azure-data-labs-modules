module "virtual_machine" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/virtual-machine"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id = data.azurerm_subnet.snet_default.id

  jumphost_username = var.jumphost_username
  jumphost_password = var.jumphost_password

  module_enabled = true

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

