module "network_security_rule" {
  source                      = "../"
  resource_group_name         = module.local_rg.name
  name                        = "TestRule"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = module.local_network_security_group.name
}

# Modules dependencies

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_network_security_group" {
  source              = "../../network-security-group"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
}