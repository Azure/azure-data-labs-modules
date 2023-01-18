
# Modules dependencies
module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source        = "../../virtual-network"
  rg_name       = module.local_rg.name
  basename      = "vnet-${random_string.postfix.result}-sql-default"
  location      = var.location
  address_space = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source           = "../../subnet"
  rg_name          = module.local_rg.name
  name             = "snet-${random_string.postfix.result}-sql-default"
  vnet_name        = module.local_vnet.name
  address_prefixes = ["10.0.6.0/24"]
  subnet_delegation = {
    delegation = [{
      name    = "Microsoft.Sql/managedInstances"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  }] }
}

module "network_security_group" {
  source   = "../../network-security-group"
  basename = "nsg-${random_string.postfix.result}"
  rg_name  = var.rg_name
  location = var.location
  tags     = {}
}

module "route_table" {
  source   = "../../route-table"
  basename = "route-${random_string.postfix.result}"
  rg_name  = var.rg_name
  location = var.location
  tags     = {}
}

// sql_managed_instance module
module "sql_managed_instance" {
  source                         = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/sql-managed-instance?ref=feature/sqlami"
  basename                       = "sqlmi-${random_string.postfix.result}"
  rg_name                        = var.rg_name
  location                       = var.location
  subnet_id                      = module.local_snet_default.id
  route_table_id                 = module.route_table.id
  network_security_group_id      = module.network_security_group.id
  administrator_login            = "sqladminuser"
  administrator_login_password   = "ThisIsNotVerySecure!"
  module_enabled                 = true
  tags                           = {}
  license_type                   = "BasePrice"
  sku_name                       = "GP_Gen5"
  storage_size_in_gb             = 32
  vcores                         = 4
  maintenance_configuration_name = "SQL_Default"
  dns_zone_partner_id            = ""
  collation                      = "SQL_Latin1_General_CP1_CI_AS"
  minimum_tls_version            = "1.2"
  proxy_override                 = "Default"
  public_data_endpoint_enabled   = false
  storage_account_type           = "GRS"
  timezone_id                    = "UTC"
}


# # Private Endpoint configuration

# resource "azurerm_private_endpoint" "sql_pe_server" {
#   name                = "pe-${azurerm_sql_server.adl_sql[0].name}-server"
#   location            = var.location
#   resource_group_name = var.rg_name
#   subnet_id           = var.subnet_id

#   private_service_connection {
#     name                           = "psc-server-${var.basename}"
#     private_connection_resource_id = azurerm_sql_server.adl_sql[0].id
#     subresource_names              = ["sqlServer"]
#     is_manual_connection           = false
#   }

#   private_dns_zone_group {
#     name                 = "private-dns-zone-group-server"
#     private_dns_zone_ids = var.private_dns_zone_ids
#   }

#   count = var.is_sec_module && var.module_enabled ? 1 : 0

#   tags = var.tags
# }
