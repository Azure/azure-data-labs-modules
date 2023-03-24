# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/batch_account

resource "azurerm_batch_account" "adl_batch_account" {
  name                                = "batchaccount${var.basename}"
  location                            = var.location
  resource_group_name                 = var.resource_group_name
  pool_allocation_mode                = var.pool_allocation_mode
  storage_account_id                  = var.storage_account_id
  storage_account_authentication_mode = "StorageKeys"
  allowed_authentication_modes        = var.allowed_authentication_modes
  identity {
    type = "SystemAssigned"
  }
  # key_vault_reference { # Required if var.pool_allocation is UserSubscription
  #   id  = ""
  #   url = ""
  # }
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags

  count = var.module_enabled ? 1 : 0
}

module "batchacc_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_batch_account.adl_batch_account[0].name}-batchacc"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_batch_account.adl_batch_account[0].id
  subresource_names              = ["batchAccount"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}
