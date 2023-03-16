# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_cluster

resource "azurerm_log_analytics_cluster" "adl_logc" {
  name                = "logc-${var.basename}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size_gb             = var.size_gb
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}