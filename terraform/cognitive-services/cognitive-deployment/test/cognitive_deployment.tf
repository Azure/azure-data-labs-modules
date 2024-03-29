module "cognitive_deployment" {
  source               = "../"
  basename             = random_string.postfix.result
  cognitive_account_id = module.cognitive_account.id
  model_format         = "OpenAI"
  model_name           = "text-embedding-ada-002"
  model_version        = "2"
  scale_type           = "Standard"
  tags                 = {}
}

# Module dependencies

module "cognitive_account" {
  source               = "../../cognitive-account"
  basename             = random_string.postfix.result
  resource_group_name  = module.local_rg.name
  location             = var.location
  kind                 = "OpenAI"
  subnet_id            = module.local_snet_default.id
  private_dns_zone_ids = [module.local_pdnsz_cog.list[local.dns_cog].id]
  tags                 = {}
}

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source              = "../../../virtual-network"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source              = "../../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-kv-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_pdnsz_cog" {
  source              = "../../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_cog]
  vnet_id             = module.local_vnet.id
}