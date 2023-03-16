module "subnet_route_table_association" {
  source         = "../"
  subnet_id      = module.local_snet_default.id
  route_table_id = module.local_route_table.id
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

module "local_snet_default" {
  source              = "../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-rt-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_route_table" {
  source              = "../../route-table"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
}