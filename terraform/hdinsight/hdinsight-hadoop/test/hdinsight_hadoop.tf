module "hdinsight_hadoop" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  subnet_id          = data.azurerm_subnet.snet_default.id
  virtual_network_id = data.azurerm_virtual_network.vnet_default.id

  cluster_version          = "4.0"
  component_version_hadoop = "3.1"

  gateway_username                        = "adminuser"
  gateway_password                        = "This1sNotVerySecure!"
  ssh_username                            = "sshuser"
  ssh_password                            = "This1sNotVerySecure!"
  roles_head_node_vm_size                 = "A6"
  roles_worker_node_vm_size               = "A5"
  roles_worker_node_target_instance_count = 2
  roles_zookeeper_node_vm_size            = "Small"
  tier                                    = "Standard"

  storage_resource_id           = module.local_storage_account.id
  filesystem_id                 = module.local_storage_account.adls_id
  storage_account_is_default    = true
  managed_identity_resource_id  = module.local_user_managed_identity.id
  managed_identity_principal_id = module.local_user_managed_identity.principal_id

  ambari_server_name                           = module.local_sql_server.name
  ambari_database_name                         = module.local_sql_database_ambari.name
  ambari_database_administrator_login          = "sqladminuser"
  ambari_database_administrator_login_password = "ThisIsNotVerySecure!"

  hive_server_name                           = module.local_sql_server.name
  hive_database_name                         = module.local_sql_database_hive.name
  hive_database_administrator_login          = "sqladminuser"
  hive_database_administrator_login_password = "ThisIsNotVerySecure!"

  oozie_server_name                           = module.local_sql_server.name
  oozie_database_name                         = module.local_sql_database_oozie.name
  oozie_database_administrator_login          = "sqladminuser"
  oozie_database_administrator_login_password = "ThisIsNotVerySecure!"

  tags = {}
}

# Data dependencies

data "azurerm_virtual_network" "vnet_default" {
  name                = local.vnet_name
  resource_group_name = var.rg_name
}

data "azurerm_subnet" "snet_default" {
  name                 = local.snet_name
  virtual_network_name = local.vnet_name
  resource_group_name  = var.rg_name
}

# Module dependencies

module "local_storage_account" {
  source                  = "../../../storage-account/test"
  rg_name                 = var.rg_name
  location                = var.location
  is_sec_module           = false
  firewall_default_action = "Allow"
}

module "local_user_managed_identity" {
  source   = "../../../user-assigned-identity/test"
  rg_name  = var.rg_name
  location = var.location
}

module "local_sql_server" {
  source        = "../../../sql-database-server/test"
  rg_name       = var.rg_name
  location      = var.location
  is_sec_module = false
}

module "local_sql_database_ambari" {
  source      = "../../../sql-database/test"
  rg_name     = var.rg_name
  location    = var.location
  server_name = module.local_sql_server.name
}

module "local_sql_database_hive" {
  source      = "../../../sql-database/test"
  rg_name     = var.rg_name
  location    = var.location
  server_name = module.local_sql_server.name
}

module "local_sql_database_oozie" {
  source      = "../../../sql-database/test"
  rg_name     = var.rg_name
  location    = var.location
  server_name = module.local_sql_server.name
}