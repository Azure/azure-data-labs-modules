# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_database

locals {
  safe_basename = replace(var.basename, "-", "")
}

resource "azurerm_sql_database" "adl_sqldb" {
  name                = "sqldb${local.safe_basename}"
  resource_group_name = var.rg_name
  location            = var.location
  server_name         = var.server_name

  collation                        = var.collation
  edition                          = var.edition
  requested_service_objective_name = var.requested_service_objective_name

  count = var.module_enabled ? 1 : 0
  tags  = var.tags
}