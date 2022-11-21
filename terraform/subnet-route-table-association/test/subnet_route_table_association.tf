module "subnet_route_table_association" {
  source = "../"

  subnet_id      = module.local_snet_default.id
  route_table_id = module.local_route_table.id
}

# Module dependencies

module "local_vnet" {
  source = "../../virtual-network"

  rg_name  = var.rg_name
  basename = random_string.postfix.result
  location = var.location

  address_space = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source = "../../subnet"

  rg_name          = var.rg_name
  name             = "vnet-${random_string.postfix.result}-rt-default"
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
}

module "local_route_table" {
  source = "../../route-table"

  rg_name  = var.rg_name
  basename = random_string.postfix.result
  location = var.location
}