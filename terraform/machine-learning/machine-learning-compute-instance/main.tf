# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_compute_instance

resource "azurerm_machine_learning_compute_instance" "adl_mlw_compute_instance" {
  name                          = "mlwci${var.basename}"
  location                      = var.location
  machine_learning_workspace_id = var.machine_learning_workspace_id
  virtual_machine_size          = var.virtual_machine_size
  authorization_type            = var.authorization_type
  subnet_resource_id            = var.subnet_id

  count = var.module_enabled ? 1 : 0
}