# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_gremlin_database

resource "azurerm_cosmosdb_gremlin_database" "adl_cosmos_gremlin" {
  name                = var.basename
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.throughput

  count = var.module_enabled ? 1 : 0
}

module "gremlin_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${var.cosmosdb_account_name}-gremlin"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = var.cosmosdb_account_id
  subresource_names              = ["Gremlin"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}