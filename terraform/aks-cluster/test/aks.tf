module "aks" {
  source              = "../"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  dns_prefix          = "azdatalbsaks"
  default_node_pool = {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
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