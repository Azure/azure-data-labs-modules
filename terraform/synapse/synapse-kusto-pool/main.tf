# https://learn.microsoft.com/en-us/azure/templates/microsoft.synapse/workspaces/kustopools?pivots=deployment-language-terraform

locals {
  safe_basename = replace(var.basename, "-", "")
}

resource "azapi_resource" "syn_synkp" {
  type = "Microsoft.Synapse/workspaces/kustoPools@2021-06-01-preview"
  name = "synkp${local.safe_basename}"
  location = var.location
  parent_id = var.synapse_workspace_id

  tags = var.tags

  body = jsonencode({
    properties = {
      enablePurge = false,
      enableStreamingIngest = false
      optimizedAutoscale = {
        isEnabled = false,
        maximum = 1,
        minimum = 1,
        version = 1
      }
      workspaceUID = "000000000-0000-0000-0000-0000000000"
    }
    sku = {
      capacity = 2,
      name = "Compute optimized",
      size = "Small"
    }
  })

  count = var.module_enabled ? 1 : 0
}