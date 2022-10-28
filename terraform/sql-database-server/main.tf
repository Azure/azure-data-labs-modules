# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server

resource "azurerm_sql_server" "adl_sql" {
  name                         = "sql-${var.basename}"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.db_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  count = var.module_enabled ? 1 : 0
  tags  = var.tags
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "sql_pe_server" {
  name                = "pe-${azurerm_sql_server.adl_sql[0].name}-server"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-server-${var.basename}"
    private_connection_resource_id = azurerm_sql_server.adl_sql[0].id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-server"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module && var.module_enabled ? 1 : 0
  
  tags  = var.tags
}