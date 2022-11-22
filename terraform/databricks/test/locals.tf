locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "databricks-workspace"
    Toolkit = "Terraform"
  }

  dns_databricks = "privatelink.azuredatabricks.net"
}