module "aks" {
  source = "../"

  basename                        = random_string.postfix.result
  rg_name                         = module.local_rg.name
  location                        = var.location
  dns_prefix                      = "azdatalbsaks"
  private_cluster_enabled         = true
  is_sec_module                   = true
  vnet_private_endpoint_subnet_id = module.local_snet_default.id

  default_node_pool = {
    name           = "default"
    node_count     = 3
    vm_size        = "Standard_D2_v2"
    vnet_subnet_id = module.local_snet_default.id
  }

  tags = {}
}

# Module dependencies
module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source        = "../../virtual-network"
  rg_name       = module.local_rg.name
  basename      = random_string.postfix.result
  location      = var.location
  address_space = ["10.30.0.0/16"]
}

module "local_snet_default" {
  source            = "../../subnet"
  rg_name           = module.local_rg.name
  name              = "vnet-${random_string.postfix.result}-aks"
  vnet_name         = module.local_vnet.name
  address_prefixes  = ["10.0.6.0/24"]
  subnet_delegation = {}
}
