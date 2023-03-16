# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_share_account

resource "azurerm_data_share_account" "adl_dsa" {
  name                = "dsa-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}
