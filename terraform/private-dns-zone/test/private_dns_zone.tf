module "private_dns_zones" {
  source = "../"

  rg_name   = var.rg_name
  dns_zones = var.dns_zones
  vnet_id   = module.local_vnet.id

  tags = {}
}

# Module dependencies

module "local_vnet" {
  source = "../../virtual-network"

  rg_name  = var.rg_name
  basename = random_string.postfix.result
  location = var.location

  address_space = ["10.0.0.0/16"]
}