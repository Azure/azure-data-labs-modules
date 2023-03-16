# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app

resource "azurerm_linux_function_app" "adl_func_linux" {
  name                       = "func-${var.basename}"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  service_plan_id            = var.service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  enabled                    = var.enabled
  https_only                 = var.https_only
  client_certificate_enabled = var.client_certificate_enabled
  virtual_network_subnet_id  = var.virtual_network_subnet_id
  site_config {}
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}