# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace
# https://registry.terraform.io/providers/databricks/databricks/latest/docs

resource "azurerm_databricks_workspace" "adl_databricks" {
  name                        = "adb-${var.basename}"
  resource_group_name         = var.rg_name
  location                    = var.location
  sku                         = var.sku
  managed_resource_group_name = "${var.rg_name}-adb-managed"

  public_network_access_enabled         = var.is_sec_module ? false : true
  network_security_group_rules_required = var.is_sec_module ? "NoAzureDatabricksRules" : "AllRules"

  custom_parameters {
    no_public_ip        = var.is_sec_module ? true : false
    public_subnet_name  = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    virtual_network_id  = var.virtual_network_id

    public_subnet_network_security_group_association_id  = var.public_subnet_network_security_group_association_id
    private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
  }

  tags = var.tags
}

# Private Endpoint configuration

resource "azurerm_private_endpoint" "databricks_pe_be" {
  name                = "pe-${azurerm_databricks_workspace.adl_databricks.name}-databricks-be"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-databricks-be-${var.basename}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.adl_databricks.id
    subresource_names              = ["databricks_ui_api"]
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-adb"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module ? 1 : 0

  tags = var.tags
}

resource "azurerm_private_endpoint" "databricks_fe" {
  name                = "pe-${azurerm_databricks_workspace.adl_databricks.name}-databricks-fe"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-databricks-fe-${var.basename}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.adl_databricks.id
    subresource_names              = ["databricks_ui_api"]
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-adb-ui-api"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module ? 1 : 0

  tags = var.tags
}

resource "azurerm_private_endpoint" "databricks_pe_sso" {
  name                = "pe-${azurerm_databricks_workspace.adl_databricks.name}-databricks-sso"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-databricks-sso-${var.basename}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.adl_databricks.id
    subresource_names              = ["browser_authentication"]
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-adb-webauth"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  count = var.is_sec_module ? 1 : 0

  tags = var.tags
}