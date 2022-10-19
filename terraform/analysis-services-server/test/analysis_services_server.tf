module "analysis_services_server" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/analysis-services-server"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  module_enabled = true

  tags = {}
}