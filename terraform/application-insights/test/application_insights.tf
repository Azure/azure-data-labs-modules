module "application_insights" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = module.local_rg.name
  location = var.location

  tags = {}
}

# Module dependencies

module "local_rg" {
  source = "../../resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = local.tags
}