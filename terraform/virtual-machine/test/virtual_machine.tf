module "virtual_machine" {
  source              = "../"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  subnet_id           = module.local_snet_default.id
  jumphost_username   = var.jumphost_username
  jumphost_password   = var.jumphost_password
  tags                = {}
}

# Module dependencies

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source              = "../../virtual-network"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source              = "../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-vm-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}