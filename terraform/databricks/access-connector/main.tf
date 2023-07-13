# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_access_connector

resource "azurerm_databricks_access_connector" "adl_adb_access_connector" {
  name                = "adb-ac-${var.basename}"
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type         = length(var.identity_ids) == 0 ? "SystemAssigned" : "UserAssigned"
    identity_ids = length(var.identity_ids) == 0 ? [] : var.identity_ids
  }

  tags = var.tags

  count = var.module_enabled ? 1 : 0

  lifecycle {
    precondition {
      condition     = length(var.identity_ids) < 2
      error_message = "Only one User Assigned Managed Identity ID is supported per Databricks Access Connector resource."
    }
  }
}
