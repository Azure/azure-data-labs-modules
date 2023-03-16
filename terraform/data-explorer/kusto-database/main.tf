# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_database

resource "azurerm_kusto_database" "adl_dedb" {
  name                = "dedb-${var.basename}"
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.cluster_name
  hot_cache_period    = var.hot_cache_period
  soft_delete_period  = var.soft_delete_period

  count = var.module_enabled ? 1 : 0
}