module "postgresql_database" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/postgresql-database"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.psql_server.id]

  module_enabled = true
  tags           = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "psql_server" {
  name                = local.dns_psql_server
  resource_group_name = var.rg_name_dns
}