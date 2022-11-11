module "cosmosdb_mongo_database" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.cosmos_mongo.id]

  cosmosdb_account_id   = module.local_cosmosdb_account.id
  cosmosdb_account_name = module.local_cosmosdb_account.name

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "cosmos_mongo" {
  name                = local.dns_cosmos_mongo
  resource_group_name = var.rg_name_dns
}

# Module dependencies

module "local_cosmosdb_account" {
  source            = "../../cosmosdb-account/test"
  kind              = "MongoDB"
  enable_capability = "EnableMongo"
}