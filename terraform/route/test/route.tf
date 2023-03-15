module "route" {
  source              = "../"
  resource_group_name = module.local_rg.name
  name                = "TestRoute"
  route_table_name    = module.local_route_table.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

# Modules dependencies

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_route_table" {
  source              = "../../route-table"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
}
