# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue

resource "azurerm_servicebus_queue" "adl_sbq" {
  name                = "sbq-${var.basename}"
  namespace_id        = var.namespace_id
  enable_partitioning = var.enable_partitioning

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_servicebus_queue_authorization_rule" "adl_sbq_auth_rule" {
  name     = "sbq-auth-rule"
  queue_id = azurerm_servicebus_queue.adl_sbq[0].id
  listen   = var.listen
  send     = var.send
  manage   = var.manage

  count = var.module_enabled ? 1 : 0
}