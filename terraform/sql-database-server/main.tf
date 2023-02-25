# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server

resource "azurerm_mssql_server" "adl_sql" {
  name                         = "sql-${var.basename}"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.db_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version
  dynamic "azuread_administrator" {
    for_each = var.azuread_administrator
    content {
      login_username              = azuread_administrator.value["login_username"]
      object_id                   = azuread_administrator.value["object_id"]
      tenant_id                   = azuread_administrator.value["tenant_id"]
      azuread_authentication_only = azuread_administrator.value["azuread_authentication_only"]
    }
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_mssql_firewall_rule" "metastore_server_rule" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.adl_sql[0].id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"

  count = var.is_sec_module ? 0 : 1
}

resource "azurerm_private_endpoint" "sql_pe_server" {
  name                = "pe-${azurerm_mssql_server.adl_sql[0].name}-server"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-server-${var.basename}"
    private_connection_resource_id = azurerm_mssql_server.adl_sql[0].id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-server"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}
