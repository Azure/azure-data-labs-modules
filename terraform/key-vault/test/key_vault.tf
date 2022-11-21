module "key_vault" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = module.local_snet_default.id
  private_dns_zone_ids = [module.local_pdnsz_kv.list[local.dns_kv_vault].id]

  sku_name = var.sku_name

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

module "local_snet_default" {
  source = "../../subnet"

  rg_name          = var.rg_name
  name             = "vnet-${random_string.postfix.result}-kv-default"
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
}

# DNS zones

module "local_pdnsz_kv" {
  source = "../../private-dns-zone"

  rg_name   = var.rg_name
  dns_zones = [local.dns_kv_vault]
  vnet_id   = module.local_vnet.id
}