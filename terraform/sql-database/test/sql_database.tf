module "sql_database" {
  source = "../"

  basename    = random_string.postfix.result
  rg_name     = var.rg_name
  location    = var.location
  server_name = var.server_name == "" ? module.local_sql_database_server[0].name : var.server_name

  collation                        = "SQL_LATIN1_GENERAL_CP1_CI_AS"
  edition                          = "Standard"
  requested_service_objective_name = "S0"

  module_enabled = true

  tags = {}
}

# Module dependencies

module "local_sql_database_server" {
  source        = "../../sql-database-server/test"
  rg_name       = var.rg_name
  location      = var.location
  is_sec_module = false
  module_enabled = var.server_name == "" ? true : false
}