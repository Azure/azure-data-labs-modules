# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights

resource "azurerm_application_insights" "adl_appi" {
  name                       = "appi-${var.basename}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  application_type           = var.application_type
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled
  tags                       = var.tags

  count = var.module_enabled ? 1 : 0
}