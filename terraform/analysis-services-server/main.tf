# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/analysis_services_server
# https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-vnet-gateway

resource "azurerm_analysis_services_server" "adl_as" {
  name                    = "as${var.basename}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku                     = var.sku
  admin_users             = var.admin_users
  enable_power_bi_service = var.enable_power_bi_service
  tags                    = var.tags

  count = var.module_enabled ? 1 : 0
}