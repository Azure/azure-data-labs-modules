# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace

resource "azurerm_servicebus_namespace" "adl_sb" {
  name                          = "sb-${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  capacity                      = var.capacity
  premium_messaging_partitions  = var.premium_messaging_partitions
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_servicebus_namespace_authorization_rule" "adl_sb_auth_rule" {
  name         = "sb-auth-rule"
  namespace_id = azurerm_servicebus_namespace.adl_sb[0].id
  listen       = var.listen
  send         = var.send
  manage       = var.manage

  count = var.module_enabled ? 1 : 0
}

module "sb_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_servicebus_namespace.adl_sb[0].name}-namespace"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_servicebus_namespace.adl_sb[0].id
  subresource_names              = ["namespace"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}