module "storage_account" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id                 = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids_blob = [data.azurerm_private_dns_zone.st_blob.id]
  private_dns_zone_ids_file = [data.azurerm_private_dns_zone.st_file.id]
  private_dns_zone_ids_dfs  = [data.azurerm_private_dns_zone.st_dfs.id]

  hns_enabled                         = true
  firewall_default_action             = var.firewall_default_action
  firewall_ip_rules                   = var.firewall_ip_rules
  firewall_bypass                     = var.firewall_bypass
  firewall_virtual_network_subnet_ids = var.firewall_virtual_network_subnet_ids

  is_sec_module  = var.is_sec_module
  module_enabled = true

  tags = {}
}

# Data dependencies

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_private_dns_zone" "st_blob" {
  name                = local.dns_st_blob
  resource_group_name = var.rg_name_dns
}

data "azurerm_private_dns_zone" "st_file" {
  name                = local.dns_st_file
  resource_group_name = var.rg_name_dns
}

data "azurerm_private_dns_zone" "st_dfs" {
  name                = local.dns_st_dfs
  resource_group_name = var.rg_name_dns
}

data "http" "ip" {
  url = "https://ifconfig.me"
}