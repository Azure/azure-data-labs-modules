module "route" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/route"

  rg_name = var.rg_name
  name    = "TestRoute"

  route_table_name = module.local_route_table.name
  address_prefix   = "0.0.0.0/0"
  next_hop_type    = "Internet"
}

# Module dependencies

module "local_route_table" {
  source = "../../route-table/test"
}
