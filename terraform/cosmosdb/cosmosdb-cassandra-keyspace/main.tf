# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_cassandra_keyspace

resource "azurerm_cosmosdb_cassandra_keyspace" "adl_cosmos_cassandra" {
  name                = var.basename
  resource_group_name = var.rg_name
  account_name        = var.cosmosdb_account_name
  throughput          = 400
}

resource "azurerm_private_endpoint" "cassandra_pe" {
  name                = "pe-${var.cosmosdb_account_name}-cassandra"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-cassandra-${var.basename}"
    private_connection_resource_id = var.cosmosdb_account_id
    subresource_names              = ["Cassandra"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-cassandra"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module ? 1 : 0

  tags = var.tags
}