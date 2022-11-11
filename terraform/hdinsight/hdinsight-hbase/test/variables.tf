resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "Central US"
}

variable "rg_name" {
  type    = string
  default = "rg-adl-modules-test-01-cus"
}

variable "rg_name_dns" {
  type    = string
  default = "rg-adl-modules-test-01-global-dns"
}