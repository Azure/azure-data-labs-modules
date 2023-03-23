module "self_hosted_integration_runtime" {
  source                     = "../"
  basename                   = random_string.postfix.result
  resource_group_name        = module.local_rg.name
  location                   = var.location
  vnet_id                    = module.local_vnet.id
  subnet_id                  = module.local_snet_default.id
  data_factory_id            = module.local_data_factory.id
  storage_account_name       = module.storage_account.name
  storage_account_access_key = module.storage_account.access_key
  virtual_machine_user       = "azureuser"
  virtual_machine_password   = "ThisIsNotVerySecure!"
  tags                       = local.tags

  depends_on = [
    time_sleep.wait_40_seconds
  ]
}

# Module dependencies

module "local_data_factory" {
  source                      = "../../data-factory"
  basename                    = random_string.postfix.result
  resource_group_name         = module.local_rg.name
  location                    = var.location
  subnet_id                   = module.local_snet_default.id
  private_dns_zone_ids_df     = [module.local_pdnsz_adf_df.list[local.dns_adf_df].id]
  private_dns_zone_ids_portal = [module.local_pdnsz_adf_portal.list[local.dns_adf_portal].id]
  tags                        = local.tags
}

module "storage_account" {
  source                              = "../../../storage-account"
  basename                            = random_string.postfix.result
  resource_group_name                 = module.local_rg.name
  location                            = var.location
  subnet_id                           = module.local_snet_default.id
  is_private_endpoint                 = true
  private_dns_zone_ids_blob           = [module.local_pdnsz_st_blob.list[local.dns_st_blob].id]
  firewall_ip_rules                   = [data.http.ip.response_body]
  firewall_virtual_network_subnet_ids = var.firewall_virtual_network_subnet_ids
  tags                                = local.tags
}

# Wait for pe auto approval for VM Extension to access script
resource "time_sleep" "wait_40_seconds" {
  depends_on = [
    module.storage_account
  ]
  create_duration = "40s"
}

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
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
  name                = "vnet-${random_string.postfix.result}-adf-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

# DNS zones

module "local_pdnsz_adf_df" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_adf_df]
  vnet_id             = module.local_vnet.id
}

module "local_pdnsz_adf_portal" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_adf_portal]
  vnet_id             = module.local_vnet.id
}

module "local_pdnsz_st_blob" {
  source = "../../../private-dns-zone"

  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_st_blob]
  vnet_id             = module.local_vnet.id
}

# Data Sources

data "http" "ip" {
  url = "https://ifconfig.me"
}
