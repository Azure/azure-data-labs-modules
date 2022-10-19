# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_search_service" "adl_srch" {
  name                = "srch-${var.basename}"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku

  partition_count = var.partition_count
  replica_count   = var.replica_count

  public_network_access_enabled = false
  # allowed_ips                   = [data.http.ip.body]

  tags = var.tags
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "srch_pe" {
  name                = "pe-${azurerm_search_service.adl_srch.name}-service"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-srch-${var.basename}"
    private_connection_resource_id = azurerm_search_service.adl_srch.id
    subresource_names              = ["searchService"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-srch"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  tags = var.tags
}