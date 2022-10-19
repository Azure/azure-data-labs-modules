module "virtual_network" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/virtual-network"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  address_space = ["10.0.0.0/16"]

  tags = {}
}