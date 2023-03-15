module "subnet_network_security_group_association" {
  source                    = "../"
  subnet_id                 = module.local_snet_default.id
  network_security_group_id = module.local_network_security_group.id
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
  name                = "vnet-${random_string.postfix.result}-snet-nsg-association-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_network_security_group" {
  source              = "../../network-security-group"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
}