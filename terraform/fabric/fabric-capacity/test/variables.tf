resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "sku" {
  type    = string
  default = "F2"
}

variable "admin_email" {
  type    = string
  default = "<>"
}
