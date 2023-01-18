# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance

# Associate subnet and the security group
resource "azurerm_subnet_network_security_group_association" "adl_sqlmi" {
  subnet_id                 = var.subnet_id
  network_security_group_id = var.network_security_group_id
  count                     = var.module_enabled ? 1 : 0
}

# Associate subnet and the route table
resource "azurerm_subnet_route_table_association" "adl_sqlmi" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
  count          = var.module_enabled ? 1 : 0
}

resource "azurerm_mssql_managed_instance" "adl_sqlmi" {
  name                = "sqlmi-${var.basename}"
  resource_group_name = var.rg_name
  location            = var.location

  license_type                   = var.license_type
  sku_name                       = var.sku_name
  storage_size_in_gb             = var.storage_size_in_gb
  storage_account_type           = var.storage_account_type
  subnet_id                      = var.subnet_id
  vcores                         = var.vcores
  maintenance_configuration_name = var.maintenance_configuration_name
  dns_zone_partner_id            = var.dns_zone_partner_id == "" ? null : var.dns_zone_partner_id

  identity {
    type = "SystemAssigned"
  }

  collation                    = var.collation
  proxy_override               = var.proxy_override
  public_data_endpoint_enabled = var.public_data_endpoint_enabled
  timezone_id                  = var.timezone_id

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  count = var.module_enabled ? 1 : 0
  tags  = var.tags
  depends_on = [
    azurerm_subnet_route_table_association.adl_sqlmi,
    azurerm_subnet_network_security_group_association.adl_sqlmi
  ]

}

