# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment

resource "azurerm_cognitive_deployment" "adl_cog_dpl" {
  name                 = "cog-dpl-${var.basename}"
  cognitive_account_id = var.cognitive_account_id
  model {
    format  = var.model_format
    name    = var.model_name
    version = var.model_version
  }
  scale {
    type = var.scale_type
  }
  rai_policy_name = var.rai_policy_name

  count = var.module_enabled ? 1 : 0
}