module "linux_function_app" {
  source                     = "../"
  basename                   = random_string.postfix.result
  resource_group_name        = module.local_rg.name
  location                   = var.location
  storage_account_name       = module.local_storage_account.name
  storage_account_access_key = module.local_storage_account.access_key
  service_plan_id            = module.local_service_plan.id
  tags                       = {}
}

# Modules dependencies

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_storage_account" {
  source                  = "../../../storage-account"
  basename                = random_string.postfix.result
  resource_group_name     = module.local_rg.name
  location                = var.location
  hns_enabled             = true
  firewall_default_action = "Allow"
  firewall_ip_rules       = [data.http.ip.response_body]
  firewall_bypass         = ["AzureServices"]
  is_sec_module           = false
}

data "http" "ip" {
  url = "https://ifconfig.me"
}

module "local_service_plan" {
  source              = "../../../service-plan"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
}