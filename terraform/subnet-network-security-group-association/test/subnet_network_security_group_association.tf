module "subnet_network_security_group_association" {
  source = "../"

  subnet_id                 = module.local_subnet.id
  network_security_group_id = module.local_network_security_group.id
}

# Module dependencies

module "local_subnet" {
  source = "../../subnet/test"
}

module "local_network_security_group" {
  source = "../../network-security-group/test"
}