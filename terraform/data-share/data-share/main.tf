# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_share
# As of today, there is no support for Data Share invitation, subscription and dataset mapping: https://github.com/hashicorp/terraform-provider-azurerm/issues/14010

resource "azurerm_data_share" "adl_ds" {
  name        = "ds_${var.basename}"
  account_id  = var.account_id
  kind        = var.kind
  description = var.description
  terms       = var.terms

  dynamic "snapshot_schedule" {
    for_each = var.snapshot_schedule
    content {
      name       = snapshot_schedule.value["name"]
      recurrence = snapshot_schedule.value["recurrence"]
      start_time = snapshot_schedule.value["start_time"]
    }
  }

  count = var.module_enabled ? 1 : 0
}
