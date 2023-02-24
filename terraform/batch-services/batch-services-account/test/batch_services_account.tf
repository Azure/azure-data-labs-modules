module "batch_services_account" {
  source                        = "../"
  basename                      = random_string.postfix.result
  rg_name                       = module.local_rg.name
  location                      = var.location
  pool_allocation_mode          = "BatchService"
  storage_account_id            = module.local_storage_account.id
  public_network_access_enabled = false
  subnet_id                     = module.local_snet_default.id
  private_dns_zone_ids          = [module.local_pdnsz_batch.list[local.dns_batch].id]
  tags                          = {}
}

# Module dependencies

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_storage_account" {
  source   = "../../../storage-account"
  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location
  tags     = {}
}

module "local_vnet" {
  source        = "../../../virtual-network"
  basename      = random_string.postfix.result
  rg_name       = module.local_rg.name
  location      = var.location
  address_space = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source           = "../../../subnet"
  name             = "vnet-${random_string.postfix.result}-kv-default"
  rg_name          = module.local_rg.name
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
}

module "local_pdnsz_batch" {
  source    = "../../../private-dns-zone"
  rg_name   = module.local_rg.name
  dns_zones = [local.dns_batch]
  vnet_id   = module.local_vnet.id
}
