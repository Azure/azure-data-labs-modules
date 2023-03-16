module "virtual_network_peering" {
  source                    = "../"
  basename                  = random_string.postfix.result
  resource_group_name       = module.local_rg.name
  virtual_network_name      = module.virtual_network_1.name
  remote_virtual_network_id = module.virtual_network_2.id
}

# Module dependencies

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "virtual_network_1" {
  source              = "../../virtual-network"
  basename            = "${random_string.postfix.result}vnet2"
  resource_group_name = module.local_rg.name
  location            = var.location
  address_space       = ["10.0.1.0/24"]
  tags                = local.tags
}

module "virtual_network_2" {
  source              = "../../virtual-network"
  basename            = "${random_string.postfix.result}vnet1"
  resource_group_name = module.local_rg.name
  location            = var.location
  address_space       = ["10.0.2.0/24"]
  tags                = local.tags
}