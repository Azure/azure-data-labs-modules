module "storage_account" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/storage-account"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id                 = data.azurerm_subnet.snet_default.id
  private_dns_zone_ids_blob = [data.azurerm_private_dns_zone.st_blob.id]
  private_dns_zone_ids_file = [data.azurerm_private_dns_zone.st_file.id]
  # private_dns_zone_ids_dfs  = [data.azurerm_private_dns_zone.st_dfs.id]

  hns_enabled                         = false
  firewall_default_action             = "Deny"
  firewall_ip_rules                   = [data.http.ip.body]
  firewall_bypass                     = ["AzureServices"]
  firewall_virtual_network_subnet_ids = []

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

data "http" "ip" {
  url = "https://ifconfig.me"
}

# data "azurerm_private_dns_zone" "st_dfs" {
#   name                = local.dns_st_dfs
#   resource_group_name = var.rg_name_dns
# }