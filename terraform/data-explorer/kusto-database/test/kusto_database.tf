module "kusto_database" {
  source = "../"

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