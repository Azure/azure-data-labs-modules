module "private_dns_zones" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/private-dns-zone"

  rg_name = var.rg_name

  vnet_id   = module.local_virtual_network.id
  dns_zones = var.dns_zones

  tags = {}
}

# Module dependencies

module "local_virtual_network" {
  source = "../../virtual-network/test"
}