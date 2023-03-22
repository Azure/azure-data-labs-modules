module "synapse_workspace" {
  source                   = "../"
  basename                 = random_string.postfix.result
  resource_group_name      = module.local_rg.name
  location                 = var.location
  subnet_id                = module.local_snet_default.id
  private_dns_zone_ids_sql = [module.local_pdnsz_syn_sql.list[local.dns_syn_sql].id]
  private_dns_zone_ids_dev = [module.local_pdnsz_syn_dev.list[local.dns_syn_dev].id]
  adls_id                  = module.local_storage_account.adls_id
  storage_account_id       = module.local_storage_account.id
  storage_account_name     = module.local_storage_account.name
  synadmin_username        = var.synadmin_username
  synadmin_password        = var.synadmin_password
  set_aad_login            = false
  is_private_endpoint      = true
  tags                     = {}
}

# Module dependencies

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_storage_account" {
  source                    = "../../../storage-account"
  basename                  = random_string.postfix.result
  resource_group_name       = module.local_rg.name
  location                  = var.location
  subnet_id                 = module.local_snet_default.id
  private_dns_zone_ids_blob = [module.local_pdnsz_st_blob.list[local.dns_st_blob].id]
  private_dns_zone_ids_dfs  = [module.local_pdnsz_st_dfs.list[local.dns_st_dfs].id]
  hns_enabled               = true
  firewall_default_action   = "Allow"
  firewall_ip_rules         = [data.http.ip.response_body]
  firewall_bypass           = ["AzureServices"]
  is_private_endpoint       = true
}

data "http" "ip" {
  url = "https://ifconfig.me"
}

module "local_vnet" {
  source              = "../../../virtual-network"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source              = "../../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-syn-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_pdnsz_st_blob" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_st_blob]
  vnet_id             = module.local_vnet.id
}

module "local_pdnsz_st_dfs" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_st_dfs]
  vnet_id             = module.local_vnet.id
}

module "local_pdnsz_syn_sql" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_syn_sql]
  vnet_id             = module.local_vnet.id
}

module "local_pdnsz_syn_dev" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_syn_dev]
  vnet_id             = module.local_vnet.id
}