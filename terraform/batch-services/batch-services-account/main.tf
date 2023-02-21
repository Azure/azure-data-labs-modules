# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/batch_account

resource "azurerm_batch_account" "adl_batch_account" {
  name                                = "batch-account-${var.basename}"
  location                            = var.location
  resource_group_name                 = var.rg_name
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

  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_private_endpoint" "batchacc_pe" {
  name                = "pe-${azurerm_batch_account.adl_batch_account[0].name}-batchacc"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-batchacc-${var.basename}"
    private_connection_resource_id = azurerm_batch_account.adl_batch_account[0].id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-cog"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && (var.public_network_access_enabled ? false : true) ? 1 : 0
}
