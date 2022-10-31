resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "rg_name" {
  type    = string
  default = "rg-adl-modules-test"
}