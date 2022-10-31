# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_database

resource "azurerm_mariadb_server" "adl_mariadb_server" {
  name                = "mariadb-server-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = var.sku_name

  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  version                      = var.ver

  public_network_access_enabled = var.is_sec_module ? false : true
  ssl_enforcement_enabled       = var.ssl_enforcement_enabled

  count = var.module_enabled ? 1 : 0
  tags  = var.tags
}

resource "azurerm_mariadb_database" "adl_mariadb" {
  name                = "mariadb${var.basename}"
  resource_group_name = var.rg_name
  server_name         = azurerm_mariadb_server.adl_mariadb_server[0].name
  charset             = var.charset
  collation           = var.collation

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "sql_pe_mariadb" {
  name                = "pe-${azurerm_mariadb_server.adl_mariadb_server[0].name}-mariadb"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-mariadb-${var.basename}"
    private_connection_resource_id = azurerm_mariadb_server.adl_mariadb_server[0].id
    subresource_names              = ["mariadbServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-mariadb"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module && var.module_enabled ? 1 : 0

  tags = var.tags
}