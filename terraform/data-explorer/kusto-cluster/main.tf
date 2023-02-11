# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_kusto_cluster" "adl_dec" {
  name                = "dec${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name
  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }
  auto_stop_enabled             = var.auto_stop_enabled
  disk_encryption_enabled       = var.disk_encryption_enabled
  streaming_ingestion_enabled   = var.streaming_ingestion_enabled
  public_network_access_enabled = var.is_sec_module ? false : true
  purge_enabled                 = var.purge_enabled
  zones                         = var.zones
  engine                        = var.engine
  tags                          = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "dec_pe" {
  name                = "pe-${azurerm_kusto_cluster.adl_dec[0].name}-dec"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-dec-${var.basename}"
    private_connection_resource_id = azurerm_kusto_cluster.adl_dec[0].id
    subresource_names              = ["cluster"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-dec"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}