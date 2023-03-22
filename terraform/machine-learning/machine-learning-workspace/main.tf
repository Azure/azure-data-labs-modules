# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_workspace

data "http" "ip" {
  url = "https://ifconfig.me"
}

resource "azurerm_machine_learning_workspace" "adl_mlw" {
  name                          = "mlw-${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  application_insights_id       = var.application_insights_id
  key_vault_id                  = var.key_vault_id
  storage_account_id            = var.storage_account_id
  container_registry_id         = var.container_registry_id
  public_network_access_enabled = var.public_network_access_enabled
  image_build_compute_name      = var.image_build_compute_name
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

module "mlw_pe" {
  source                         = "../../private-endpoint"
  basename                       = "${azurerm_machine_learning_workspace.adl_mlw[0].name}-amlw"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  subnet_id                      = var.subnet_id
  private_connection_resource_id = azurerm_machine_learning_workspace.adl_mlw[0].id
  subresource_names              = ["amlworkspace"]
  is_manual_connection           = false
  private_dns_zone_ids           = var.private_dns_zone_ids
  tags                           = var.tags
  module_enabled                 = var.module_enabled && var.is_private_endpoint
}