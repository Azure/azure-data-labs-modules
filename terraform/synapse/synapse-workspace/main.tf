# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace

data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_synapse_workspace" "adl_syn" {
  name                                 = "syn-${var.basename}"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.adls_id
  sql_administrator_login              = var.synadmin_username
  sql_administrator_login_password     = var.synadmin_password
  managed_virtual_network_enabled      = var.managed_virtual_network_enabled
  managed_resource_group_name          = "${var.resource_group_name}-syn-managed"
  public_network_access_enabled        = var.public_network_access_enabled
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_synapse_workspace_aad_admin" "syn_aad_login" {
  synapse_workspace_id = azurerm_synapse_workspace.adl_syn[0].id
  login                = "AzureAD Admin"
  object_id            = var.aad_login.object_id
  tenant_id            = var.aad_login.tenant_id

  count = var.set_aad_login ? 1 : 0
}

resource "azurerm_synapse_firewall_rule" "allow_my_ip" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.adl_syn[0].id
  start_ip_address     = var.is_private_endpoint ? data.http.ip.response_body : "0.0.0.0"
  end_ip_address       = var.is_private_endpoint ? data.http.ip.response_body : "255.255.255.255"

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_role_assignment" "syn_ws_sa_role_si_sbdc" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_synapse_workspace.adl_syn[0].identity[0].principal_id

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_role_assignment" "syn_ws_sa_role_si_c" {
  scope                = var.storage_account_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_synapse_workspace.adl_syn[0].identity[0].principal_id

  count = var.module_enabled ? 1 : 0
}

module "syn_ws_pe_dev" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_synapse_workspace.adl_syn[0].name}-dev"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_synapse_workspace.adl_syn[0].id
  subresource_names              = ["dev"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids_dev
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint

  count = var.module_enabled ? 1 : 0
}

module "syn_ws_pe_sql" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_synapse_workspace.adl_syn[0].name}-sql"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_synapse_workspace.adl_syn[0].id
  subresource_names              = ["sql"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids_sql
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint

  count = var.module_enabled ? 1 : 0
}

module "syn_ws_pe_sqlondemand" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_synapse_workspace.adl_syn[0].name}-sqlondemand"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_synapse_workspace.adl_syn[0].id
  subresource_names              = ["sqlondemand"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids_sql
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_synapse_role_assignment" "syn_ws_role_default_user" {
  synapse_workspace_id = azurerm_synapse_workspace.adl_syn[0].id
  role_name            = "Synapse Administrator"
  principal_id         = var.aad_login.object_id
  depends_on           = [time_sleep.wait_40_seconds]

  count = var.module_enabled && var.set_aad_login ? 1 : 0
}

resource "time_sleep" "wait_40_seconds" {
  depends_on = [
    module.syn_ws_pe_sqlondemand,
    module.syn_ws_pe_sql,
    module.syn_ws_pe_dev,
    azurerm_synapse_firewall_rule.allow_my_ip
  ]
  create_duration = "40s"
}