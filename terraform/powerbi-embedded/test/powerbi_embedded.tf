module "powerbi_embedded" {
  source = "../"

  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location

  administrators = ["<>"]

  tags = {}
}

# Modules dependencies

module "local_rg" {
  source = "../../resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = local.tags
}
