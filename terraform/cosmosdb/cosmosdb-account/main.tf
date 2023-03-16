# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_cosmosdb_account" "adl_cosmos" {
  name                                  = "cosmos-${var.basename}"
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  offer_type                            = var.offer_type
  kind                                  = var.kind
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  enable_automatic_failover             = var.enable_automatic_failover
  public_network_access_enabled         = var.public_network_access_enabled
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "Eventual"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }
  dynamic "capabilities" {
    for_each = var.enable_capabilities
    content {
      name = capabilities.value
    }
  }
  ip_range_filter = data.http.ip.response_body
  tags            = var.tags

  count = var.module_enabled ? 1 : 0
}