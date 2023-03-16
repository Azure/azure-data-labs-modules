# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

resource "azurerm_subnet" "adl_snet" {
  name                                          = var.name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.vnet_name
  address_prefixes                              = var.address_prefixes
  private_endpoint_network_policies_enabled     = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  service_endpoints                             = var.service_endpoints
  service_endpoint_policy_ids                   = length(var.service_endpoint_policy_ids) > 0 ? var.service_endpoint_policy_ids : null
  dynamic "delegation" {
    for_each = var.subnet_delegation
    content {
      name = delegation.key

      dynamic "service_delegation" {
        for_each = toset(delegation.value)
        content {
          name    = service_delegation.value.name
          actions = service_delegation.value.actions
        }
      }
    }
  }

  count = var.module_enabled ? 1 : 0
}