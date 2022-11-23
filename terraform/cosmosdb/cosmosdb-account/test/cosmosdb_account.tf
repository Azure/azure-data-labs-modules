module "cosmosdb_account" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location

  kind              = var.kind
  enable_capability = var.enable_capability

  module_enabled = true

  tags = {}
}

# Module dependencies

module "local_rg" {
  source = "../../../resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = local.tags
}