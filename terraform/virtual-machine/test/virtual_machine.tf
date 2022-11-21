module "virtual_machine" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = local.location

  subnet_id = module.local_snet_default.id

  jumphost_username = var.jumphost_username
  jumphost_password = var.jumphost_password

  module_enabled = true

  tags = {}
}

# Module dependencies

module "local_rg" {
  source = "../../resource-group"

  basename = random_string.postfix.result
  location = local.location

  tags = local.tags
}

module "local_vnet" {
  source = "../../virtual-network"

  rg_name  = module.local_rg.name
  basename = random_string.postfix.result
  location = local.location

  address_space = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source = "../../subnet"

  rg_name          = module.local_rg.name
  name             = "vnet-${random_string.postfix.result}-vm-default"
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
}