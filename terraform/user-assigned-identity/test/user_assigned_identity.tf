module "user_assigned_identity" {
  source = "../"

  basename = random_string.postfix.result
  rg_name  = var.rg_name
  location = var.location

  tags = {}
}