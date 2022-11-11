module "cosmosdb_account" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  kind              = var.kind
  enable_capability = var.enable_capability

  module_enabled = true

  tags = {}
}