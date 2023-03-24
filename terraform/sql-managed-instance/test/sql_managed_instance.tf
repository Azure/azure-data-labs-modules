module "sql_managed_instance" {
  source                         = "../"
  basename                       = "sqlmi-${random_string.postfix.result}"
  resource_group_name            = module.local_rg.name
  location                       = var.location
  subnet_id                      = module.local_snet_default.id
  subnet_private_enpoint_id      = module.local_snet_private_enpoint.id
  route_table_id                 = module.route_table.id
  network_security_group_id      = module.network_security_group.id
  administrator_login            = "sqladminuser"
  administrator_login_password   = "ThisIsNotVerySecure!"
  module_enabled                 = true
  is_private_endpoint            = var.is_private_endpoint
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
  private_dns_zone_group_name    = "azuredataLabs"
  private_dns_zone_ids           = [module.local_pdnsz_sqlmi.list[local.dns_sql_server].id]
}

# Modules dependencies

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source              = "../../virtual-network"
  resource_group_name = module.local_rg.name
  basename            = "vnet-${random_string.postfix.result}-sql-default"
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source              = "../../subnet"
  resource_group_name = module.local_rg.name
  name                = "snet-${random_string.postfix.result}-sqlmi-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
  subnet_delegation = {
    delegation = [{
      name    = "Microsoft.Sql/managedInstances"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  }] }
}

module "local_snet_private_enpoint" {
  source              = "../../subnet"
  resource_group_name = module.local_rg.name
  name                = "snet-${random_string.postfix.result}-sqlmi-private-endpoint"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.5.0/24"]
}

module "network_security_group" {
  source              = "../../network-security-group"
  basename            = "nsg-${random_string.postfix.result}"
  resource_group_name = module.local_rg.name
  location            = var.location
  tags                = {}
}

module "route_table" {
  source              = "../../route-table"
  basename            = "route-${random_string.postfix.result}"
  resource_group_name = module.local_rg.name
  location            = var.location
  tags                = {}
}

module "local_pdnsz_sqlmi" {
  source              = "../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_sql_server]
  vnet_id             = module.local_vnet.id
}
