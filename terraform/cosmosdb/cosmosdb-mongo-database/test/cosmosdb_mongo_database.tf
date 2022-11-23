module "cosmosdb_mongo_database" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location

  subnet_id            = module.local_snet_default.id
  private_dns_zone_ids = [module.local_pdnsz_cosmos_mongo.list[local.dns_cosmos_mongo].id]

  cosmosdb_account_id   = module.local_cosmosdb_account.id
  cosmosdb_account_name = module.local_cosmosdb_account.name

  tags = {}
}

# Module dependencies

module "local_rg" {
  source = "../../../resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = local.tags
}

module "local_cosmosdb_account" {
  source            = "../../cosmosdb-account"

    basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location

  kind              = "MongoDB"
  enable_capability = "EnableMongo"

  module_enabled = true
}

module "local_vnet" {
  source = "../../../virtual-network"

  rg_name  = module.local_rg.name
  basename = random_string.postfix.result
  location = var.location

  address_space = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source = "../../../subnet"

  rg_name          = module.local_rg.name
  name             = "vnet-${random_string.postfix.result}-mongo-default"
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
}

# DNS zones

module "local_pdnsz_cosmos_mongo" {
  source = "../../../private-dns-zone"

  rg_name   = module.local_rg.name
  dns_zones = [local.dns_cosmos_mongo]
  vnet_id   = module.local_vnet.id
}