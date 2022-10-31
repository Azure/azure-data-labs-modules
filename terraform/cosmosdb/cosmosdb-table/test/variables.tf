resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "rg_name" {
  type    = string
  default = "rg-adl-modules-test-we"
}

variable "rg_name_dns" {
  type    = string
  default = "rg-adl-modules-test-global-dns-we"
}
