# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall

resource "azurerm_firewall" "adl_afw" {
  name                = "afw-${var.basename}"
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  zones               = var.zones
  threat_intel_mode   = var.threat_intel_mode
  firewall_policy_id  = azurerm_firewall_policy.adl_afwp.id

 dynamic "ip_configuration" {
    iterator = pip
    for_each = var.sku_name != "AZFW_Hub" ? azurerm_public_ip.adl_afw_pip_config : []
    content {
      name                 = lower("fw_ip_config_${pip.value.name}")
      subnet_id            = contains([pip.value.name], "${var.basename}-pip-1") ? var.subnet_id : null
      public_ip_address_id = pip.value.id
    }
  }

  dynamic "management_ip_configuration" {
    for_each = var.management_subnet_id != null ? [1] : []
    content {
      name                 = lower("fw_ip_management_${azurerm_public_ip.adl_afw_pip_mngmt[0].ip_address}")
      subnet_id            = var.management_subnet_id
      public_ip_address_id = azurerm_public_ip.adl_afw_pip_mngmt[0].id
    }
  }

  dynamic "virtual_hub" {
    for_each = var.virtual_hub_id != null && var.sku_name == "AZFW_Hub" ? [1] : []
    content {
      virtual_hub_id  = var.virtual_hub_id
      public_ip_count = var.pip_count
    }
  }

  tags  = var.tags

  count = var.module_enabled ? 1 : 0
}

# Public IP for the firewall

resource "azurerm_public_ip" "adl_afw_pip_config" {
  count               = var.sku_name != "AZFW_Hub" && var.module_enabled ? var.public_ip_count : 0
  name                = "${var.name}-${count.index + 1}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  zones               = var.zones
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_public_ip" "adl_afw_pip_mngmt" {
  count               = var.management_subnet_id != null && var.sku_name != "AZFW_Hub" && var.module_enabled ? 1 : 0
  name                = "${var.name}-management-pip"
  resource_group_name = var.rg_name
  location            = var.location
  zones               = var.zones
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

# Policies

resource "azurerm_firewall_policy" "adl_afwp" {
  name                = "${var.name}-policy"
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

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  count = var.module_enabled ? 1 : 0
}