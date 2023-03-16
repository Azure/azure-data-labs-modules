# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub

resource "azurerm_eventhub" "adl_evh" {
  name                = "evh-${var.basename}"
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  partition_count     = var.partition_count
  message_retention   = var.message_retention

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_eventhub_authorization_rule" "adl_evh_auth_rule" {
  name                = "evh-auth-rule"
  namespace_name      = var.namespace_name
  eventhub_name       = azurerm_eventhub.adl_evh[0].name
  resource_group_name = var.resource_group_name
  listen              = var.listen
  send                = var.send
  manage              = var.manage

  count = var.module_enabled ? 1 : 0
}