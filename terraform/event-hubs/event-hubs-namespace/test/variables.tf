resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "rg_name" {
  type    = string
  default = "rg-azurelabs-modules-01"
}

variable "rg_name_dns" {
  type    = string
  default = "rg-azurelabs-modules-01-global-dns"
}