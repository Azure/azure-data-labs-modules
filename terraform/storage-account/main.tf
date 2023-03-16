# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_storage_account" "adl_st" {
  name                          = "st${var.basename}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  account_kind                  = var.account_kind
  is_hns_enabled                = var.hns_enabled
  min_tls_version               = var.min_tls_version
  public_network_access_enabled = true #var.is_sec_module ? false : true
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_role_assignment" "st_role_admin_c" {
  scope                = azurerm_storage_account.adl_st[0].id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_client_config.current.object_id

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_role_assignment" "st_role_admin_sbdc" {
  scope                = azurerm_storage_account.adl_st[0].id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_storage_data_lake_gen2_filesystem" "st_adls" {
  name               = "default"
  storage_account_id = azurerm_storage_account.adl_st[0].id
  depends_on = [
    azurerm_role_assignment.st_role_admin_sbdc,
    azurerm_storage_account_network_rules.firewall_rules
  ]

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_storage_account_network_rules" "firewall_rules" {
  storage_account_id         = azurerm_storage_account.adl_st[0].id
  default_action             = var.firewall_default_action
  ip_rules                   = var.firewall_ip_rules
  virtual_network_subnet_ids = var.firewall_virtual_network_subnet_ids
  bypass                     = var.firewall_bypass

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_private_endpoint" "st_pe_blob" {
  name                = "pe-${azurerm_storage_account.adl_st[0].name}-blob"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-blob-${var.basename}"
    private_connection_resource_id = azurerm_storage_account.adl_st[0].id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-blob"
    private_dns_zone_ids = var.private_dns_zone_ids_blob
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module && length(var.private_dns_zone_ids_blob) != 0 ? 1 : 0
}

resource "azurerm_private_endpoint" "st_pe_file" {
  name                = "pe-${azurerm_storage_account.adl_st[0].name}-file"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-file-${var.basename}"
    private_connection_resource_id = azurerm_storage_account.adl_st[0].id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-file"
    private_dns_zone_ids = var.private_dns_zone_ids_file
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module && length(var.private_dns_zone_ids_file) != 0 ? 1 : 0
}

resource "azurerm_private_endpoint" "st_pe_dfs" {
  name                = "pe-${azurerm_storage_account.adl_st[0].name}-dfs"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-dfs-${var.basename}"
    private_connection_resource_id = azurerm_storage_account.adl_st[0].id
    subresource_names              = ["dfs"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-dfs"
    private_dns_zone_ids = var.private_dns_zone_ids_dfs
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module && length(var.private_dns_zone_ids_dfs) != 0 ? 1 : 0
}