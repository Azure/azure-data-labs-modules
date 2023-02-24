module "private_dns_zones" {
  source    = "../"
  rg_name   = module.local_rg.name
  dns_zones = var.dns_zones
  vnet_id   = module.local_vnet.id
  tags      = {}
}

# Modules dependencies

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source        = "../../virtual-network"
  rg_name       = module.local_rg.name
  basename      = random_string.postfix.result
  location      = var.location
  address_space = ["10.0.0.0/16"]
}