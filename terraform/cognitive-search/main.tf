# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_search_service" "adl_srch" {
  name                          = "srch-${var.basename}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.sku
  partition_count               = var.partition_count
  replica_count                 = var.replica_count
  public_network_access_enabled = var.public_network_access_enabled
  # allowed_ips                   = [data.http.ip.response_body]
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

module "srch_pe" {
  source                         = "../private-endpoint"
  basename                       = "${azurerm_search_service.adl_srch[0].name}-service"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_search_service.adl_srch[0].id
  subresource_names              = ["searchService"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}