module "cognitive_services" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/cognitive-services"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  kind                 = "Face"
  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.cog.id]

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "cog" {
  name                = local.dns_cog
  resource_group_name = var.rg_name_dns
}