module "fabric_capacity" {
  source            = "../"
  basename          = random_string.postfix.result
  resource_group_id = module.local_rg.id
  location          = var.location
  sku               = var.sku
  admin_email       = var.admin_email
  tags              = {}
}

# Modules dependencies

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}