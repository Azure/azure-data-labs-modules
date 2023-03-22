# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_database

resource "azurerm_mysql_flexible_server" "adl_mysql_server" {
  name                = "mysql-server-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  delegated_subnet_id = var.is_private_endpoint ? var.subnet_id : null
  private_dns_zone_id = var.is_private_endpoint ? var.private_dns_zone_id : null
  storage {
    auto_grow_enabled = var.auto_grow_enabled
    size_gb           = var.storage_gb
  }
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  administrator_login          = var.administrator_login
  administrator_password       = var.administrator_password
  version                      = var.ver
  identity {
    type         = length(var.identity_ids) == 0 ? "SystemAssigned" : "UserAssigned"
    identity_ids = length(var.identity_ids) == 0 ? [] : var.identity_ids
  }
  dynamic "customer_managed_key" {
    for_each = var.customer_managed_key
    content {
      key_vault_key_id                  = customer_managed_key.value["key_vault_key_id"]
      primary_user_assigned_identity_id = customer_managed_key.value["primary_user_assigned_identity_id"]
    }
  }
  lifecycle {
    ignore_changes = [
      zone
    ]
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_mysql_flexible_database" "adl_mysql" {
  name                = "mysql-${var.basename}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.adl_mysql_server[0].name
  charset             = var.charset
  collation           = var.collation

  count = var.module_enabled ? 1 : 0
}