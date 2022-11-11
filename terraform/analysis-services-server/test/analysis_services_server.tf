module "analysis_services_server" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  module_enabled = true

  tags = {}
}