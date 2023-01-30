resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "rg_name_dns" {
  type    = string
  default = "rg-adl-modules-test-01-global-dns"
}

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = false
}
