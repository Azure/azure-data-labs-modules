module "network_security_group" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/network-security-group"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  tags = {}
}