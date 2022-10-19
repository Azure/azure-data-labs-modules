# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_database

resource "azurerm_mysql_server" "adl_mysql_server" {
  name                = "mysql-server-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version    = var.ver

  auto_grow_enabled                 = var.auto_grow_enabled
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled

  public_network_access_enabled    = var.public_network_access_enabled
  ssl_enforcement_enabled          = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced = var.ssl_minimal_tls_version_enforced

  count = var.module_enabled ? 1 : 0
  tags  = var.tags
}

resource "azurerm_mysql_database" "adl_mysql" {
  name                = "mysql-${var.basename}"
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_server.adl_mysql_server[0].name
  charset             = var.charset
  collation           = var.collation

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "sql_pe_mysql" {
  name                = "pe-${azurerm_mysql_server.adl_mysql_server[0].name}-mysql"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-mysql-${var.basename}"
    private_connection_resource_id = azurerm_mysql_server.adl_mysql_server[0].id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-mysql"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.module_enabled ? 1 : 0
  tags  = var.tags
}