# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app

resource "azurerm_linux_function_app" "adl_func_linux" {
  name                = "func-${var.basename}"
  resource_group_name = var.rg_name
  location            = var.location

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id            = var.service_plan_id

  site_config {}

  tags = var.tags
}