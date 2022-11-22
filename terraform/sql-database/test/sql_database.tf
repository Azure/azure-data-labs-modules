module "sql_database" {
  source = "../"

  basename    = random_string.postfix.result
  rg_name     = module.local_rg.name
  location    = var.location
  server_name = module.local_sql_database_server.name

  collation                        = "SQL_LATIN1_GENERAL_CP1_CI_AS"
  edition                          = "Standard"
  requested_service_objective_name = "S0"

  module_enabled = true

  tags = {}
}

# Modules dependencies

module "local_rg" {
  source = "../../resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = local.tags
}

module "local_sql_database_server" {
  source = "../../sql-database-server/test"
}