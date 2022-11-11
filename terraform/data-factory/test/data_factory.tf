module "data_factory" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id                   = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids_df     = [data.azurerm_private_dns_zone.adf_df.id]
  private_dns_zone_ids_portal = [data.azurerm_private_dns_zone.adf_portal.id]

  module_enabled = true

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "adf_df" {
  name                = local.dns_adf_df
  resource_group_name = var.rg_name_dns
}

data "azurerm_private_dns_zone" "adf_portal" {
  name                = local.dns_adf_portal
  resource_group_name = var.rg_name_dns
}