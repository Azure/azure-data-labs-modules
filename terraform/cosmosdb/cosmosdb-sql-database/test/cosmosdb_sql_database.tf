module "cosmosdb_sql_database" {
  source                = "../"
  basename              = random_string.postfix.result
  resource_group_name   = module.local_rg.name
  location              = var.location
  subnet_id             = module.local_snet_default.id
  private_dns_zone_ids  = [module.local_pdnsz_cosmos_sql.list[local.dns_cosmos_sql].id]
  cosmosdb_account_id   = module.local_cosmosdb_account.id
  cosmosdb_account_name = module.local_cosmosdb_account.name
  tags                  = {}
}

# Module dependencies

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_cosmosdb_account" {
  source              = "../../cosmosdb-account"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  kind                = "GlobalDocumentDB"
  enable_capabilities = ["DisableRateLimitingResponses"]
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
  name                = "vnet-${random_string.postfix.result}-sql-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_pdnsz_cosmos_sql" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_cosmos_sql]
  vnet_id             = module.local_vnet.id
}