# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/analysis_services_server
# https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-vnet-gateway

locals {
  safe_basename = replace(var.basename, "-", "")
}

resource "azurerm_analysis_services_server" "adl_as" {
  name                    = "as${local.safe_basename}"
  location                = var.location
  resource_group_name     = var.rg_name
  sku                     = var.sku
  admin_users             = var.admin_users
  enable_power_bi_service = var.enable_power_bi_service

  count = var.module_enabled ? 1 : 0

  tags = var.tags
}