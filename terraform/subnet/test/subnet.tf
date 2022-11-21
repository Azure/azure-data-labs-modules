module "subnet" {
  source = "../"

  rg_name = var.rg_name
  name    = "snet-test"

  vnet_name        = module.local_vnet.name
  address_prefixes = var.address_prefixes
}

# Module dependencies

module "local_vnet" {
  source = "../../virtual-network"

  rg_name = var.rg_name
  basename = random_string.postfix.result
  location = var.location

  address_space = ["10.0.0.0/16"]
}