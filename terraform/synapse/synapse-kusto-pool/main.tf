# https://learn.microsoft.com/en-us/azure/templates/microsoft.synapse/workspaces/kustopools?pivots=deployment-language-terraform

resource "random_string" "postfix" {
  length  = 12
  special = false
  upper   = false
}

resource "azapi_resource" "syn_synkp" {
  type      = "Microsoft.Synapse/workspaces/kustoPools@2021-06-01-preview"
  name      = "synkp${var.basename}"
  location  = var.location
  parent_id = var.synapse_workspace_id
  body = jsonencode({
    properties = {
      enablePurge           = var.enable_purge,
      enableStreamingIngest = var.enable_streaming_ingest
      optimizedAutoscale = {
        isEnabled = var.optimized_autoscale_enabled,
        maximum   = var.optimized_autoscale_maximum,
        minimum   = var.optimized_autoscale_minimum,
        version   = var.optimized_autoscale_version
      }
      workspaceUID = var.synapse_workspace_uid
    }
    sku = {
      capacity = var.sku_capacity,
      name     = var.sku_name,
      size     = var.sku_size
    }
  })
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}