module "container_registry" {
  source               = "../"
  basename             = random_string.postfix.result
  resource_group_name  = module.local_rg.name
  location             = var.location
  subnet_id            = module.local_snet_default.id
  private_dns_zone_ids = [module.local_pdnsz_cr.list[local.dns_cr].id]
  tags                 = {}
}

# Module dependencies

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
  name                = "vnet-${random_string.postfix.result}-kv-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_pdnsz_cr" {
  source              = "../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_cr]
  vnet_id             = module.local_vnet.id
}