module "analysis_services_server" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location

  module_enabled = true

  tags = {}
}

# Module dependencies

module "local_rg" {
  source = "../../resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = local.tags
}