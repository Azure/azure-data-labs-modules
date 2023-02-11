# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_table_database

resource "azurerm_cosmosdb_table" "adl_cosmos_table" {
  name                = var.basename
  resource_group_name = var.rg_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.throughput

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_private_endpoint" "table_pe" {
  name                = "pe-${var.cosmosdb_account_name}-table"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-table-${var.basename}"
    private_connection_resource_id = var.cosmosdb_account_id
    subresource_names              = ["Table"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-table"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}