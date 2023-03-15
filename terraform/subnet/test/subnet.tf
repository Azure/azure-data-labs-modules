module "subnet" {
  source              = "../"
  resource_group_name = module.local_rg.name
  name                = "snet-test"
  vnet_name           = module.local_vnet.name
  address_prefixes    = var.address_prefixes
}

# Modules dependencies

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