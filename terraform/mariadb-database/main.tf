# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_database

resource "azurerm_mariadb_server" "adl_mariadb_server" {
  name                          = "mariadb-server-${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  backup_retention_days         = var.backup_retention_days
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
  auto_grow_enabled             = var.auto_grow_enabled
  administrator_login           = var.administrator_login
  administrator_login_password  = var.administrator_login_password
  version                       = var.ver
  public_network_access_enabled = var.public_network_access_enabled
  ssl_enforcement_enabled       = var.ssl_enforcement_enabled
  tags                          = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_mariadb_database" "adl_mariadb" {
  name                = "mariadb${var.basename}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.adl_mariadb_server[0].name
  charset             = var.charset
  collation           = var.collation

  count = var.module_enabled ? 1 : 0
}

module "sql_pe_mariadb" {
  source                         = "../private-endpoint"
  basename                       = "${azurerm_mariadb_server.adl_mariadb_server[0].name}-mariadb"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_mariadb_server.adl_mariadb_server[0].id
  subresource_names              = ["mariadbServer"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}