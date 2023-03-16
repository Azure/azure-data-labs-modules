# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace
# https://registry.terraform.io/providers/databricks/databricks/latest/docs

resource "azurerm_databricks_workspace" "adl_databricks" {
  name                                  = "adb-${var.basename}"
  resource_group_name                   = var.resource_group_name
  location                              = var.location
  sku                                   = var.sku

  managed_resource_group_name           = "${var.resource_group_name}-adb-managed"
  public_network_access_enabled         = var.public_network_enabled
  network_security_group_rules_required = var.is_sec_module ? "NoAzureDatabricksRules" : "AllRules"
  custom_parameters {
    no_public_ip                                         = var.is_sec_module
    public_subnet_name                                   = var.public_subnet_name
    private_subnet_name                                  = var.private_subnet_name
    virtual_network_id                                   = var.virtual_network_id
    public_subnet_network_security_group_association_id  = var.public_subnet_network_security_group_association_id
    private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0

  lifecycle {
    precondition {
      condition     = (var.is_sec_module || var.public_network_enabled)
      error_message = "Deny public access requires a private link endpoint (is_sec_module set to 'true')"
    }

    precondition {
      condition     = (!var.enable_ip_access_list || var.public_network_enabled)
      error_message = "IP access list only applies to requests made over the Internet (public_network_enabled set to 'true')"
    }
  }
}

resource "azurerm_private_endpoint" "databricks_pe_be" {
  name                = "pe-${azurerm_databricks_workspace.adl_databricks[0].name}-databricks-be"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.backend_subnet_id
  private_service_connection {
    name                           = "psc-databricks-be-${var.basename}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.adl_databricks[0].id
    subresource_names              = ["databricks_ui_api"]
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-adb"
    private_dns_zone_ids = var.backend_private_dns_zone_ids
  }
  tags = var.tags

  # Only deploy if backend and frontend use different private endpoints
  count = var.module_enabled && var.maximum_network_security ? 1 : 0

  lifecycle {
    precondition {
      condition     = (var.is_sec_module && var.maximum_network_security)
      error_message = "'maximum_network_security' is only available when 'sec_module' is set to 'true'"
    }
  }
}

resource "azurerm_private_endpoint" "databricks_fe" {
  name                = "pe-${azurerm_databricks_workspace.adl_databricks[0].name}-databricks-fe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-databricks-fe-${var.basename}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.adl_databricks[0].id
    subresource_names              = ["databricks_ui_api"]
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-adb-ui-api"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}

resource "azurerm_private_endpoint" "databricks_pe_sso" {
  name                = "pe-${azurerm_databricks_workspace.adl_databricks[0].name}-databricks-sso"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-databricks-sso-${var.basename}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.adl_databricks[0].id
    subresource_names              = ["browser_authentication"]
  }
  private_dns_zone_group {
    name                 = "private-dns-zone-group-adb-webauth"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  tags = var.tags

  count = var.module_enabled && var.is_sec_module ? 1 : 0
}

provider "databricks" {
  alias                       = "adl-adb"
  host                        = azurerm_databricks_workspace.adl_databricks[0].workspace_url
  azure_workspace_resource_id = azurerm_databricks_workspace.adl_databricks[0].id
}

resource "databricks_workspace_conf" "adb_ws_conf" {
  provider = databricks.adl-adb
  custom_config = {
    "enableIpAccessLists" : var.enable_ip_access_list
  }
  depends_on = [azurerm_databricks_workspace.adl_databricks[0]]

  count = var.module_enabled && var.enable_ip_access_list ? 1 : 0
}

resource "databricks_ip_access_list" "adb_ws_allow-list" {
  provider     = databricks.adl-adb
  label        = "allow_in"
  list_type    = "ALLOW"
  ip_addresses = var.allow_ip_list
  depends_on   = [databricks_workspace_conf.adb_ws_conf]

  count = var.module_enabled && var.enable_ip_access_list && length(var.allow_ip_list) > 0 ? 1 : 0
}

resource "databricks_ip_access_list" "adb_ws_block-list" {
  provider     = databricks.adl-adb
  label        = "block_in"
  list_type    = "BLOCK"
  ip_addresses = var.block_ip_list
  depends_on   = [databricks_workspace_conf.adb_ws_conf]

  count = var.module_enabled && var.enable_ip_access_list && length(var.block_ip_list) > 0 ? 1 : 0
}
