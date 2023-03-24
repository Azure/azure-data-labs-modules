module "batch_services_account" {
  source                        = "../"
  basename                      = random_string.postfix.result
  resource_group_name           = module.local_rg.name
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
  source                              = "../../../storage-account"
  basename                            = random_string.postfix.result
  resource_group_name                 = module.local_rg.name
  location                            = var.location
  subnet_id                           = module.local_snet_default.id
  is_private_endpoint                 = true
  private_dns_zone_ids_blob           = [module.local_pdnsz_st_blob.list[local.dns_st_blob].id]
  firewall_virtual_network_subnet_ids = var.firewall_virtual_network_subnet_ids
  tags                                = {}
}

module "local_vnet" {
  source              = "../../../virtual-network"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source              = "../../../subnet"
  name                = "vnet-${random_string.postfix.result}-kv-default"
  resource_group_name = module.local_rg.name
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_pdnsz_batch" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_batch]
  vnet_id             = module.local_vnet.id
}

module "local_pdnsz_st_blob" {
  source = "../../../private-dns-zone"

  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_st_blob]
  vnet_id             = module.local_vnet.id
}