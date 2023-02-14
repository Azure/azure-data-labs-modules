# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall

resource "azurerm_firewall" "adl_afw" {
  name                = "afw-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  zones               = var.zones
  threat_intel_mode   = var.threat_intel_mode
  firewall_policy_id  = azurerm_firewall_policy.adl_afw_afwp[0].id
  dynamic "ip_configuration" {
    iterator = pip
    for_each = var.sku_name != "AZFW_Hub" ? azurerm_public_ip.adl_afw_pip_config : []
    content {
      name                 = lower("fw_ip_config_${pip.value.name}")
      subnet_id            = contains([pip.value.name], "pip-${var.basename}-1") ? var.subnet_id : null
      public_ip_address_id = pip.value.id
    }
  }
  dynamic "management_ip_configuration" {
    for_each = var.management_subnet_id != null ? [1] : []
    content {
      name                 = lower("fw_ip_management_${azurerm_public_ip.adl_afw_pip_mngmt[0].name}")
      subnet_id            = var.management_subnet_id != null ? var.management_subnet_id : null
      public_ip_address_id = azurerm_public_ip.adl_afw_pip_mngmt[0].id
    }
  }
  # dynamic "virtual_hub" {
  #   for_each = var.sku_name == "AZFW_Hub" ? [1] : []
  #   content {
  #     virtual_hub_id  = azurerm_virtual_hub.adl_afw_vhub[0].id
  #     public_ip_count = var.pip_count
  #   }
  # }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

# Public IP for the firewall

resource "azurerm_public_ip" "adl_afw_pip_config" {
  count               = var.sku_name != "AZFW_Hub" && var.module_enabled ? var.public_ip_count : 0
  name                = "pip-${var.basename}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.rg_name
  zones               = var.zones
  allocation_method   = var.pip_allocation_method
  sku                 = var.pip_sku

  tags = var.tags
}

resource "azurerm_public_ip" "adl_afw_pip_mngmt" {
  count               = var.sku_name != "AZFW_Hub" && var.module_enabled ? 1 : 0
  name                = "pip-${var.basename}-mngmt"
  location            = var.location
  resource_group_name = var.rg_name
  zones               = var.zones
  allocation_method   = var.pip_allocation_method
  sku                 = var.pip_sku

  tags = var.tags
}

# Firewall policy

resource "azurerm_firewall_policy" "adl_afw_afwp" {
  name                = "afwp-${var.basename}"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku_policy

  dynamic "dns" {
    for_each = var.proxy_enabled != false ? [1] : []
    content {
      proxy_enabled = true
      servers       = var.dns_servers != null ? var.dns_servers : null
    }
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

# # Virtual Hub

# resource "azurerm_virtual_wan" "adl_afw_vwan" {
#   name                = "vwan-${var.basename}"
#   resource_group_name = var.rg_name
#   location            = var.location

#   count = var.sku_name == "AZFW_Hub" && var.module_enabled ? 1 : 0
# }

# resource "azurerm_virtual_hub" "adl_afw_vhub" {
#   name                = "vhub-${var.basename}"
#   resource_group_name = var.rg_name
#   location            = var.location
#   virtual_wan_id      = azurerm_virtual_wan.adl_afw_vwan[0].id
#   address_prefix      = "10.0.1.0/24"

#   count = var.sku_name == "AZFW_Hub" && var.module_enabled ? 1 : 0
# }