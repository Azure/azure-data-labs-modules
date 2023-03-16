# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_job

resource "azurerm_stream_analytics_job" "adl_asa" {
  name                                     = "asa-${var.basename}"
  resource_group_name                      = var.resource_group_name
  location                                 = var.location
  compatibility_level                      = var.compatibility_level
  data_locale                              = var.data_locale
  events_late_arrival_max_delay_in_seconds = var.events_late_arrival_max_delay_in_seconds
  events_out_of_order_max_delay_in_seconds = var.events_out_of_order_max_delay_in_seconds
  events_out_of_order_policy               = var.events_out_of_order_policy
  output_error_policy                      = var.output_error_policy
  streaming_units                          = var.streaming_units
  transformation_query                     = <<QUERY
    SELECT *
    INTO [YourOutputAlias]
    FROM [YourInputAlias]
QUERY
  tags                                     = var.tags

  count = var.module_enabled ? 1 : 0
}