resource "azapi_resource" "fab_capacity" {
  type                      = "Microsoft.Fabric/capacities@2022-07-01-preview"
  name                      = "fab${var.basename}"
  parent_id                 = var.resource_group_id
  location                  = var.location
  schema_validation_enabled = false

  body = jsonencode({
    properties = {
      administration = {
        members = [
          var.admin_email
        ]
      }
    }
    sku = {
      name = var.sku,
      tier = "Fabric"
    }
  })
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}