module "cognitive_search" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location

  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.cs_search.id]

  tags = {}
}

# Module dependencies

module "local_rg" {
  source = "../../resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = local.tags
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = module.local_rg.name
}

data "azurerm_private_dns_zone" "cs_search" {
  name                = local.dns_cs_search
  resource_group_name = module.local_rg.name_dns
}