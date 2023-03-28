# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "adl_kv" {
  name                          = "kv-${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.sku_name
  enabled_for_disk_encryption   = var.enabled_for_disk_encryption
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled
  public_network_access_enabled = var.is_sec_module ? false : true
  enabled_for_deployment        = var.enabled_for_deployment
  network_acls {
    default_action             = var.firewall_default_action
    ip_rules                   = var.firewall_ip_rules
    virtual_network_subnet_ids = var.firewall_virtual_network_subnet_ids
    bypass                     = var.firewall_bypass
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

# Private Endpoint configuration

module "kv_pe" {
  source                         = "../private-endpoint"
  basename                       = "${azurerm_key_vault.adl_kv[0].name}-vault"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_key_vault.adl_kv[0].id
  subresource_names              = ["vault"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_sec_module

  count = var.module_enabled ? 1 : 0
}