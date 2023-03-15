# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "adl_vnet" {
  name                = "vnet-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan
    content {
      id     = lookup(ddos_protection_plan.value, "id", null)
      enable = lookup(ddos_protection_plan.value, "enable", false)
    }
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}