module "databricks" {
  source                                               = "../"
  basename                                             = random_string.postfix.result
  resource_group_name                                  = module.local_rg.name
  location                                             = var.location
  virtual_network_id                                   = module.local_vnet.id
  subnet_id                                            = module.local_snet_default.id
  private_dns_zone_ids                                 = [module.local_pdnsz_adb.list[local.dns_databricks].id]
  public_subnet_name                                   = module.local_snet_public.name
  private_subnet_name                                  = module.local_snet_private.name
  public_subnet_network_security_group_association_id  = module.local_snet_nsg_association_public.id
  private_subnet_network_security_group_association_id = module.local_snet_nsg_association_private.id
  public_network_enabled                               = true
  enable_ip_access_list                                = true
  allow_ip_list                                        = ["${data.http.ip.body}/32"]
  tags                                                 = {}
}

# Modules dependencies

data "http" "ip" {
  url = "https://ifconfig.me"
}

module "local_rg" {
  source   = "../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source              = "../../virtual-network"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source              = "../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-adb-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_snet_public" {
  source              = "../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-adb-public"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.4.0/24"]
  subnet_delegation = {
    databricks-del-pub = [
      {
        name = "Microsoft.Databricks/workspaces"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
      }
    ]
  }
}

module "local_snet_private" {
  source              = "../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-adb-private"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.5.0/24"]
  subnet_delegation = {
    databricks-del-pri = [
      {
        name = "Microsoft.Databricks/workspaces"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
      }
    ]
  }
}

module "local_nsg" {
  source              = "../../network-security-group"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
}

module "local_snet_nsg_association_public" {
  source                    = "../../subnet-network-security-group-association"
  subnet_id                 = module.local_snet_public.id
  network_security_group_id = module.local_nsg.id
}

module "local_snet_nsg_association_private" {
  source                    = "../../subnet-network-security-group-association"
  subnet_id                 = module.local_snet_private.id
  network_security_group_id = module.local_nsg.id
}

module "local_pdnsz_adb" {
  source              = "../../private-dns-zone"
  resource_group_name = module.local_rg.name
  dns_zones           = [local.dns_databricks]
  vnet_id             = module.local_vnet.id
}