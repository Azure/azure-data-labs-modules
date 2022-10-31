module "sql_database_server" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/sql-database-server"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.sql_server.id]

  db_version                   = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "ThisIsNotVerySecure!"

  module_enabled = true

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "sql_server" {
  name                = local.dns_sql_server
  resource_group_name = var.rg_name_dns
}