module "private_endpoint" {
  source                         = "../"
  basename                       = "kv-${random_string.postfix.result}"
  resource_group_name            = module.local_rg.name
  location                       = var.location
  subnet_id                      = module.local_snet_default.id
  private_connection_resource_id = module.local_key_vault.id
  subresource_names              = ["vault"]
  private_dns_zone_ids           = [module.local_pdnsz_kv.list[local.dns_kv_vault].id]
  tags                           = {}
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
  name                = "vnet-${random_string.postfix.result}-kv-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_key_vault" {
  source              = "../../key-vault"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  sku_name            = "standard"
  is_private_endpoint = false
}

module "local_pdnsz_kv" {
  source              = "../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_kv_vault]
  vnet_id             = module.local_vnet.id
}