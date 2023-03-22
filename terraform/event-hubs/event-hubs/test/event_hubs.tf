module "event_hubs" {
  source              = "../"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  namespace_name      = module.event_hubs_namespace.name
}

# Module dependencies

module "event_hubs_namespace" {
  source              = "../../event-hubs-namespace"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  is_private_endpoint = false
  tags                = {}
}

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}