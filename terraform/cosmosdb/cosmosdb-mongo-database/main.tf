# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_database

resource "azurerm_cosmosdb_mongo_database" "adl_cosmos_mongo" {
  name                = var.basename
  resource_group_name = var.rg_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.throughput
}

resource "azurerm_private_endpoint" "mongo_pe" {
  name                = "pe-${var.cosmosdb_account_name}-mongo"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-mongo-${var.basename}"
    private_connection_resource_id = var.cosmosdb_account_id
    subresource_names              = ["MongoDB"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-mongo"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module ? 1 : 0

  tags = var.tags
}
