module "resource_group" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/resource-group"

  basename = random_string.postfix.result
  location = var.location

  tags = {}
}