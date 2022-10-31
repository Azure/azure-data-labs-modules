module "user_assigned_identity" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/user-assigned-identity"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  tags = {}
}