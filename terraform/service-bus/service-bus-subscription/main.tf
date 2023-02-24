# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_subscription

resource "azurerm_servicebus_subscription" "adt_sbs" {
  name               = "sbs-${var.basename}"
  topic_id           = var.topic_id
  max_delivery_count = var.max_delivery_count

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_servicebus_subscription_rule" "adl_sbs_auth_rule" {
  name            = "sbs-auth-rule"
  subscription_id = azurerm_servicebus_subscription.adt_sbs[0].id
  filter_type     = var.filter_type
  sql_filter      = var.sql_filter

  count = var.module_enabled ? 1 : 0
}