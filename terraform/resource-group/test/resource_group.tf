module "resource_group" {
  source   = "../"
  basename = random_string.postfix.result
  location = var.location
  tags     = local.tags
}