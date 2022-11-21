module "subnet_network_security_group_association" {
  source = "../"

  subnet_id                 = module.local_snet_default.id
  network_security_group_id = module.local_network_security_group.id
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
  name             = "vnet-${random_string.postfix.result}-snet-nsg-association-default"
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
}

module "local_network_security_group" {
  source = "../../network-security-group"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location
}