# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_database

resource "azurerm_mssql_database" "adl_sqldb" {
  name      = "sqldb${var.basename}"
  server_id = var.server_id
  collation = var.collation
  tags      = var.tags

  count = var.module_enabled ? 1 : 0
}