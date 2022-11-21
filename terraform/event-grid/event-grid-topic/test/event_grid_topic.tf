module "event_grid_topic" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = module.local_snet_default.id
  private_dns_zone_ids = [module.local_pdnsz_ev_topic.list[local.dns_ev_topic].id]

  tags = {}
}

# Module dependencies

module "local_vnet" {
  source = "../../../virtual-network"

  rg_name  = var.rg_name
  basename = random_string.postfix.result
  location = var.location

  address_space = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source = "../../../subnet"

  rg_name          = var.rg_name
  name             = "vnet-${random_string.postfix.result}-evt-default"
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
}

# DNS zones

module "local_pdnsz_ev_topic" {
  source = "../../../private-dns-zone"

  rg_name   = var.rg_name
  dns_zones = [local.dns_ev_topic]
  vnet_id   = module.local_vnet.id
}