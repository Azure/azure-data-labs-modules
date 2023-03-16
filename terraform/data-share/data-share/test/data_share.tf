module "data_share" {
  source            = "../"
  basename          = random_string.postfix.result
  account_id        = module.local_data_share_account.id
  snapshot_schedule = var.snapshot_schedule
}

# Module dependencies

module "local_data_share_account" {
  source              = "../../data-share-account"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  tags                = {}
}

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}
