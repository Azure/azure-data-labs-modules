module "network_security_rule" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/network-security-rule"

  rg_name = var.rg_name
  name    = "TestRule"

  priority                   = 100
  direction                  = "Outbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = "*"
  destination_address_prefix = "*"

  network_security_group_name = module.local_network_security_group.name
}

# Module dependencies

module "local_network_security_group" {
  source = "../../network-security-group/test"
}
