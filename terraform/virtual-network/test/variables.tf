resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}