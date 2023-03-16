module "cosmosdb_account" {
  source              = "../"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  kind                = var.kind
  enable_capabilities = var.enable_capabilities
  tags                = {}
}

# Module dependencies

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}