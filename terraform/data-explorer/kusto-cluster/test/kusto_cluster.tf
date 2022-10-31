module "kusto_cluster" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/data-explorer/kusto-cluster"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id            = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids = [data.azurerm_private_dns_zone.dec_cluster.id]

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "dec_cluster" {
  name                = local.dns_dec_cluster
  resource_group_name = var.rg_name_dns
}