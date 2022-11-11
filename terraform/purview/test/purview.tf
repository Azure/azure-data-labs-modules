module "purview" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id                    = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids_account = [data.azurerm_private_dns_zone.pview_portal.id]
  private_dns_zone_ids_portal  = [data.azurerm_private_dns_zone.pview_acount.id]

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "pview_portal" {
  name                = local.dns_pview_portal
  resource_group_name = var.rg_name_dns
}

data "azurerm_private_dns_zone" "pview_acount" {
  name                = local.dns_pview_account
  resource_group_name = var.rg_name_dns
}
