# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace

resource "azurerm_eventhub_namespace" "adl_evhns" {
  name                          = "evhns-${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  maximum_throughput_units      = var.maximum_throughput_units
  zone_redundant                = var.zone_redundant
  auto_inflate_enabled          = var.auto_inflate_enabled
  public_network_access_enabled = var.is_sec_module ? false : true
  # network_rulesets {
  #   default_action = "Deny"
  #   # trusted_service_access_enabled = false
  #   # virtual_network_rule           = []
  #   # ip_rule                        = []
  # }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_private_endpoint" "evhns_pe" {
  name                = "pe-${azurerm_eventhub_namespace.adl_evhns[0].name}-evhns"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-evhns-${var.basename}"
    private_connection_resource_id = azurerm_eventhub_namespace.adl_evhns[0].id
    subresource_names              = ["namespace"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-evhns"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}