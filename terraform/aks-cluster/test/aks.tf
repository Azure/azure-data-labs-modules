module "aks" {
  source     = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/aks-cluster?ref=feature/AKS_TFModule"
  basename   = random_string.postfix.result
  rg_name    = var.rg_name
  location   = var.location
  dns_prefix = "azdatalbsaks"

  default_node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  tags = {}
}
