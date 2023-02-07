resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "synadmin_username" {
  type    = string
  default = "sqladminuser"
}

variable "synadmin_password" {
  type      = string
  default   = "ThisIsNotVerySecure!"
  sensitive = true
}