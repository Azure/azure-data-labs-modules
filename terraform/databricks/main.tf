# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace
# https://registry.terraform.io/providers/databricks/databricks/latest/docs


resource "azurerm_virtual_network" "adb_vnet" {
  name                = "vnet-${var.basename}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "adb_snet_public" {
  name                 = "vnet-${var.basename}-public"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.adb_vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "databricks-del-pub-${var.basename}"

    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
      ]
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

resource "azurerm_subnet" "adb_snet_private" {
  name                 = "vnet-${var.basename}-private"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.adb_vnet.name
  address_prefixes     = ["10.0.2.0/24"]

  delegation {
    name = "databricks-del-pri-${var.basename}"

    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
      ]
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

resource "azurerm_subnet" "adb_snet_pe" {
  name                 = "vnet-${var.basename}-private-endpoint"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.adb_vnet.name
  address_prefixes     = ["10.0.3.0/24"]

  private_endpoint_network_policies_enabled = false

  count = var.is_sec_module ? 1 : 0
}

resource "azurerm_subnet_network_security_group_association" "adb_snet_private_nsg" {
  subnet_id                 = azurerm_subnet.adb_snet_private.id
  network_security_group_id = azurerm_network_security_group.adb_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "adb_snet_public_nsg" {
  subnet_id                 = azurerm_subnet.adb_snet_public.id
  network_security_group_id = azurerm_network_security_group.adb_nsg.id
}

resource "azurerm_network_security_group" "adb_nsg" {
  name                = "nsg-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_databricks_workspace" "adl_databricks" {
  name                        = "adb-${var.basename}"
  resource_group_name         = var.rg_name
  location                    = var.location
  sku                         = "premium"
  managed_resource_group_name = "${var.rg_name}-adb-managed"

  public_network_access_enabled         = var.is_sec_module ? false : true
  network_security_group_rules_required = var.is_sec_module ? "NoAzureDatabricksRules" : "AllRules"

  custom_parameters {
    no_public_ip        = var.is_sec_module ? true : false
    public_subnet_name  = azurerm_subnet.adb_snet_public.name
    private_subnet_name = azurerm_subnet.adb_snet_private.name
    virtual_network_id  = azurerm_virtual_network.adb_vnet.id

    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.adb_snet_public_nsg.id
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.adb_snet_private_nsg.id
  }

  tags = var.tags
}

resource "azurerm_private_dns_zone" "databricks_dns" {
  #depends_on = [azurerm_private_endpoint.databricks_pe]

  name                = "privatelink.azuredatabricks.net"
  resource_group_name = var.rg_name

  count = var.is_sec_module ? 1 : 0
}

resource "azurerm_private_dns_zone_virtual_network_link" "databricks_dns_netlink" {
  name                  = "vnet-${var.basename}-adb-netlink"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.databricks_dns[0].name
  virtual_network_id    = azurerm_virtual_network.adb_vnet.id

  count = var.is_sec_module ? 1 : 0
}

resource "azurerm_private_endpoint" "databricks_pe_be" {
  name                = "pe-${azurerm_databricks_workspace.adl_databricks.name}-databricks-be"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = azurerm_subnet.adb_snet_pe[0].id

  private_service_connection {
    name                           = "psc-databricks-be-${var.basename}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.adl_databricks.id
    subresource_names              = ["databricks_ui_api"]
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group-adb"
    private_dns_zone_ids = [azurerm_private_dns_zone.databricks_dns[0].id]
  }

  count = var.is_sec_module ? 1 : 0
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
}