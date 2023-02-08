# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_topic

resource "azurerm_servicebus_topic" "adl_sbt" {
  name         = "sbt-${var.basename}"
  namespace_id = var.namespace_id

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_servicebus_topic_authorization_rule" "adl_sbt_auth_rule" {
  name     = "sbt-auth-rule"
  topic_id = azurerm_servicebus_topic.adl_sbt[0].id
  listen   = var.listen
  send     = var.send
  manage   = var.manage

  count = var.module_enabled ? 1 : 0
}