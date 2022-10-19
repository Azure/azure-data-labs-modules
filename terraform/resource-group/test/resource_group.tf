module "resource_group" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = {}
}