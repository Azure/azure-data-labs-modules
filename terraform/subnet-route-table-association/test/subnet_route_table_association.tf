module "subnet_route_table_association" {
  source = "../"

  subnet_id      = module.local_subnet.id
  route_table_id = module.local_route_table.id
}

# Module dependencies

module "local_subnet" {
  source = "../../subnet/test"
}

module "local_route_table" {
  source = "../../route-table/test"
}