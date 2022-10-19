module "log_analytics_workspace" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/log-analytics/log-analytics-workspace"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  tags = {}
}