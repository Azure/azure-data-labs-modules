# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_inference_cluster

locals {
  safe_basename = replace(var.basename, "-", "")
}

resource "azurerm_machine_learning_inference_cluster" "adl_mlw_inference_cluster" {
  name                  = "mlwic${local.safe_basename}"
  location              = var.location
  cluster_purpose       = var.cluster_purpose
  kubernetes_cluster_id = var.kubernetes_cluster_id

  machine_learning_workspace_id = var.machine_learning_workspace_id

  count = var.module_enabled ? 1 : 0

  tags = var.tags
}