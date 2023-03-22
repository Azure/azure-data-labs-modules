module "hdinsight_hadoop" {
  source                                       = "../"
  basename                                     = random_string.postfix.result
  resource_group_name                          = module.local_rg.name
  location                                     = var.location
  subnet_id                                    = module.local_snet_default.id
  virtual_network_id                           = module.local_vnet.id
  cluster_version                              = "4.0"
  component_version_hadoop                     = "3.1"
  gateway_username                             = "adminuser"
  gateway_password                             = "This1sNotVerySecure!"
  ssh_username                                 = "sshuser"
  ssh_password                                 = "This1sNotVerySecure!"
  roles_head_node_vm_size                      = "A6"
  roles_worker_node_vm_size                    = "A5"
  roles_worker_node_target_instance_count      = 2
  roles_zookeeper_node_vm_size                 = "Small"
  tier                                         = "Standard"
  storage_resource_id                          = module.local_storage_account.id
  filesystem_id                                = module.local_storage_account.adls_id
  storage_account_is_default                   = true
  managed_identity_resource_id                 = module.local_user_managed_identity.id
  managed_identity_principal_id                = module.local_user_managed_identity.principal_id
  ambari_server_name                           = module.local_sql_database_server.name
  ambari_database_name                         = module.local_sql_database_ambari.name
  ambari_database_administrator_login          = "sqladminuser"
  ambari_database_administrator_login_password = "ThisIsNotVerySecure!"
  hive_server_name                             = module.local_sql_database_server.name
  hive_database_name                           = module.local_sql_database_hive.name
  hive_database_administrator_login            = "sqladminuser"
  hive_database_administrator_login_password   = "ThisIsNotVerySecure!"
  oozie_server_name                            = module.local_sql_database_server.name
  oozie_database_name                          = module.local_sql_database_oozie.name
  oozie_database_administrator_login           = "sqladminuser"
  oozie_database_administrator_login_password  = "ThisIsNotVerySecure!"
  tags                                         = {}
}

# Modules dependencies

module "local_rg" {
  source   = "../../../resource-group"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}

module "local_vnet" {
  source              = "../../../virtual-network"
  resource_group_name = module.local_rg.name
  basename            = random_string.postfix.result
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

module "local_snet_default" {
  source              = "../../../subnet"
  resource_group_name = module.local_rg.name
  name                = "vnet-${random_string.postfix.result}-hadoop-default"
  vnet_name           = module.local_vnet.name
  address_prefixes    = ["10.0.6.0/24"]
}

module "local_storage_account" {
  source = "../../../storage-account"

  basename                = random_string.postfix.result
  resource_group_name     = module.local_rg.name
  location                = var.location
  hns_enabled             = true
  firewall_default_action = "Allow"
  is_private_endpoint     = false
}

module "local_user_managed_identity" {
  source              = "../../../user-assigned-identity"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
}

module "local_sql_database_server" {
  source                       = "../../../sql-database-server"
  basename                     = random_string.postfix.result
  resource_group_name          = module.local_rg.name
  location                     = var.location
  db_version                   = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "ThisIsNotVerySecure!"
  is_private_endpoint          = false
}

module "local_sql_database_ambari" {
  source              = "../../../sql-database"
  basename            = "${random_string.postfix.result}ambari"
  resource_group_name = module.local_rg.name
  location            = var.location
  server_id           = module.local_sql_database_server.id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
}

module "local_sql_database_hive" {
  source              = "../../../sql-database"
  basename            = "${random_string.postfix.result}hive"
  resource_group_name = module.local_rg.name
  location            = var.location
  server_id           = module.local_sql_database_server.id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
}

module "local_sql_database_oozie" {
  source              = "../../../sql-database"
  basename            = "${random_string.postfix.result}oozie"
  resource_group_name = module.local_rg.name
  location            = var.location
  server_id           = module.local_sql_database_server.id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
}