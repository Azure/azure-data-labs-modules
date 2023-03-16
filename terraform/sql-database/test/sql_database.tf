module "sql_database" {
  source    = "../"
  basename  = random_string.postfix.result
  server_id = module.local_sql_database_server.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  tags      = {}
}

# Modules dependencies

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_sql_database_server" {
  source                       = "../../sql-database-server"
  basename                     = random_string.postfix.result
  resource_group_name          = module.local_rg.name
  location                     = var.location
  subnet_id                    = module.local_snet_default.id
  private_dns_zone_ids         = [module.local_pdnsz_sql_blob.list[local.dns_sql_server].id]
  db_version                   = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "ThisIsNotVerySecure!"
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
  name                = "vnet-${random_string.postfix.result}-sql-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_pdnsz_sql_blob" {
  source              = "../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_sql_server]
  vnet_id             = module.local_vnet.id
}