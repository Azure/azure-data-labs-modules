# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_database

resource "azurerm_postgresql_server" "adl_psql_server" {
  name                = "psql-server-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = var.sku_name

  storage_mb                        = var.storage_mb
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  auto_grow_enabled                 = var.auto_grow_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  version                      = var.ver

  public_network_access_enabled    = var.public_network_access_enabled
  ssl_enforcement_enabled          = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced = var.ssl_minimal_tls_version_enforced

  count = var.module_enabled ? 1 : 0
  tags  = var.tags
}

resource "azurerm_postgresql_database" "adl_psql" {
  name                = "psql-${var.basename}"
  resource_group_name = var.rg_name
  server_name         = azurerm_postgresql_server.adl_psql_server[0].name
  charset             = var.charset
  collation           = var.collation

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "sql_pe_psql" {
  name                = "pe-${azurerm_postgresql_server.adl_psql_server[0].name}-psql"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-psql-${var.basename}"
    private_connection_resource_id = azurerm_postgresql_server.adl_psql_server[0].id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-psql"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module && var.module_enabled ? 1 : 0

  tags = var.tags
}