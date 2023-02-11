# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_gremlin_database

resource "azurerm_cosmosdb_gremlin_database" "adl_cosmos_gremlin" {
  name                = var.basename
  resource_group_name = var.rg_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.throughput

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_private_endpoint" "gremlin_pe" {
  name                = "pe-${var.cosmosdb_account_name}-gremlin"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-gremlin-${var.basename}"
    private_connection_resource_id = var.cosmosdb_account_id
    subresource_names              = ["Gremlin"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-gremlin"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}