# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace

resource "azurerm_servicebus_namespace" "adl_sb" {
  name                = "sb-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name

  sku      = var.sku
  capacity = var.capacity

  tags = var.tags
}

resource "azurerm_servicebus_namespace_authorization_rule" "adl_sb_auth_rule" {
  name         = "sb-auth-rule"
  namespace_id = azurerm_servicebus_namespace.adl_sb.id

  listen = var.listen
  send   = var.send
  manage = var.manage
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "sb_pe" {
  name                = "pe-${azurerm_servicebus_namespace.adl_sb.name}-namespace"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-sb-${var.basename}"
    private_connection_resource_id = azurerm_servicebus_namespace.adl_sb.id
    subresource_names              = ["namespace"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-kv"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

    count = var.is_sec_module ? 1 : 0

  tags = var.tags
}