module "storage_account" {
  source                              = "../"
  basename                            = random_string.postfix.result
  rg_name                             = module.local_rg.name
  location                            = var.location
  subnet_id                           = module.local_snet_default.id
  private_dns_zone_ids_blob           = [module.local_pdnsz_st_blob.list[local.dns_st_blob].id]
  private_dns_zone_ids_file           = [module.local_pdnsz_st_file.list[local.dns_st_file].id]
  private_dns_zone_ids_dfs            = [module.local_pdnsz_st_dfs.list[local.dns_st_dfs].id]
  hns_enabled                         = true
  firewall_default_action             = var.firewall_default_action
  firewall_ip_rules                   = [data.http.ip.response_body]
  firewall_bypass                     = var.firewall_bypass
  firewall_virtual_network_subnet_ids = "${concat(var.firewall_virtual_network_subnet_ids, [data.azurerm_subnet.subnet.id])}"
  is_sec_module                       = var.is_sec_module
  tags                                = {}
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

module "local_snet_default" {
  source           = "../../subnet"
  rg_name          = module.local_rg.name
  name             = "vnet-${random_string.postfix.result}-st-default"
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
}

module "local_pdnsz_st_blob" {
  source    = "../../private-dns-zone"
  rg_name   = module.local_rg.name
  dns_zones = [local.dns_st_blob]
  vnet_id   = module.local_vnet.id
}

module "local_pdnsz_st_dfs" {
  source    = "../../private-dns-zone"
  rg_name   = module.local_rg.name
  dns_zones = [local.dns_st_dfs]
  vnet_id   = module.local_vnet.id
}

module "local_pdnsz_st_file" {
  source    = "../../private-dns-zone"
  rg_name   = module.local_rg.name
  dns_zones = [local.dns_st_file]
  vnet_id   = module.local_vnet.id
}

data "http" "ip" {
  url = "https://ifconfig.me"
}

# Use Azure Instance Metadata Service (IMDS) REST endpoint to access information about the subnet information
data "http" "metadata" {
  url     = "http://169.254.169.254/metadata/instance/network/interface?api-version=2021-02-01"
  headers = {
    "Metadata" = "true"
  }
}

data "azurerm_subnet" "subnet" {
  name                 = local.azure_metadata[0].subnet.name
  virtual_network_name = local.azure_metadata[0].virtualNetwork.name
  resource_group_name  = local.azure_metadata[0].virtualNetwork.resourceGroup
}