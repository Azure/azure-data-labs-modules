# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster

locals {
  safe_basename = replace(var.basename, "-", "")
}

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_kusto_cluster" "adl_dec" {
  name                = "dec${local.safe_basename}"
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }

  auto_stop_enabled           = var.auto_stop_enabled
  disk_encryption_enabled     = var.disk_encryption_enabled
  streaming_ingestion_enabled = var.streaming_ingestion_enabled

  public_network_access_enabled = var.public_network_access_enabled
  purge_enabled                 = var.purge_enabled

  zones  = var.zones
  engine = var.engine

  tags = var.tags
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "dec_pe" {
  name                = "pe-${azurerm_kusto_cluster.adl_dec.name}-dec"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-dec-${var.basename}"
    private_connection_resource_id = azurerm_kusto_cluster.adl_dec.id
    subresource_names              = ["cluster"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-dec"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module ? 1 : 0

  tags = var.tags
}