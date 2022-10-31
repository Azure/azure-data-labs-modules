module "application_insights" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/application-insights"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  tags = {}
}