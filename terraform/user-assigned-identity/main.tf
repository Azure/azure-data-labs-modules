# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity

resource "azurerm_user_assigned_identity" "adl_id" {
  location            = var.location
  name                = "id-${var.basename}"
  resource_group_name = var.resource_group_name
  tags                = var.tags

  count = var.module_enabled ? 1 : 0
}