module "sql_database" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/sql-database"

  basename    = random_string.postfix.result
  rg_name     = var.rg_name
  location    = var.location
  server_name = module.local_sql_database_server.name

  collation                        = "SQL_LATIN1_GENERAL_CP1_CI_AS"
  edition                          = "Standard"
  requested_service_objective_name = "S0"

  module_enabled = true

  tags = {}
}

# Module dependencies

module "local_sql_database_server" {
  source = "../../sql-database-server/test"
}