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
      enablePurge = bool
      enableStreamingIngest = bool
      optimizedAutoscale = {
        isEnabled = bool
        maximum = int
        minimum = int
        version = int
      }
      workspaceUID = "string"
    }
    sku = {
      capacity = int
      name = "string"
      size = "string"
    }
  })

  count = var.module_enabled ? 1 : 0
}