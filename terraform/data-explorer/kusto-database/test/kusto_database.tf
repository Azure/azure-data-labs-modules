module "kusto_database" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/data-explorer/kusto-database"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  cluster_name = module.local_kusto_cluster.name

  tags = {}
}

# Module dependencies

module "local_kusto_cluster" {
  source = "../../kusto-cluster/test"
}