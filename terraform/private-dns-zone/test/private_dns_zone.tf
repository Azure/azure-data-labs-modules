module "private_dns_zones" {
  source = "../"

  rg_name   = var.rg_name
  dns_zones = var.dns_zones

  tags = {}
}