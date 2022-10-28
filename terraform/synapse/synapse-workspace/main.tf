# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace

data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_synapse_workspace" "adl_syn" {
  name                                 = "syn-${var.basename}"
  resource_group_name                  = var.rg_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.adls_id

  sql_administrator_login          = var.synadmin_username
  sql_administrator_login_password = var.synadmin_password

  managed_virtual_network_enabled = true
  managed_resource_group_name     = "${var.rg_name}-syn-managed"

  aad_admin {
    login     = var.aad_login.name
    object_id = var.aad_login.object_id
    tenant_id = var.aad_login.tenant_id
  }

  identity {
    type = "SystemAssigned"
  }

  count = var.module_enabled ? 1 : 0

  tags = var.tags
}

# Virtual Network & Firewall configuration

resource "azurerm_synapse_firewall_rule" "allow_my_ip" {
  name                 = "AllowMyPublicIp"
  synapse_workspace_id = azurerm_synapse_workspace.adl_syn[0].id
  start_ip_address     = data.http.ip.body
  end_ip_address       = data.http.ip.body

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

# Private Endpoint configuration

resource "azurerm_private_endpoint" "syn_ws_pe_dev" {
  name                = "pe-${azurerm_synapse_workspace.adl_syn[0].name}-dev"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-dev-${var.basename}"
    private_connection_resource_id = azurerm_synapse_workspace.adl_syn[0].id
    subresource_names              = ["dev"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-dev"
    private_dns_zone_ids = var.private_dns_zone_ids_dev
  }

  count = var.is_sec_module && var.module_enabled ? 1 : 0

  tags  = var.tags
}

resource "azurerm_private_endpoint" "syn_ws_pe_sql" {
  name                = "pe-${azurerm_synapse_workspace.adl_syn[0].name}-sql"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-sql-${var.basename}"
    private_connection_resource_id = azurerm_synapse_workspace.adl_syn[0].id
    subresource_names              = ["sql"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-sql"
    private_dns_zone_ids = var.private_dns_zone_ids_sql
  }

  count = var.is_sec_module && var.module_enabled ? 1 : 0

  tags  = var.tags
}

resource "azurerm_private_endpoint" "syn_ws_pe_sqlondemand" {
  name                = "pe-${azurerm_synapse_workspace.adl_syn[0].name}-sqlondemand"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-sqlondemand-${var.basename}"
    private_connection_resource_id = azurerm_synapse_workspace.adl_syn[0].id
    subresource_names              = ["sqlondemand"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-sqlondemand"
    private_dns_zone_ids = var.private_dns_zone_ids_sql
  }
  
  count = var.is_sec_module && var.module_enabled ? 1 : 0

  tags  = var.tags
}

# Synapse RBAC

resource "azurerm_synapse_role_assignment" "syn_ws_role_default_user" {
  synapse_workspace_id = azurerm_synapse_workspace.adl_syn[0].id
  role_name            = "Synapse Administrator"
  principal_id         = var.aad_login.object_id

  count = var.module_enabled ? 1 : 0

  depends_on = [time_sleep.wait_40_seconds]
}

resource "time_sleep" "wait_40_seconds" {

  depends_on = [
    azurerm_private_endpoint.syn_ws_pe_sqlondemand,
    azurerm_private_endpoint.syn_ws_pe_sql,
    azurerm_private_endpoint.syn_ws_pe_dev
  ]

  create_duration = "40s"
}