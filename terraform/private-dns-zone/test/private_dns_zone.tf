module "private_dns_zones" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/private-dns-zone"

  rg_name = var.rg_name
  dns_zones = var.dns_zones

  tags = {}
}