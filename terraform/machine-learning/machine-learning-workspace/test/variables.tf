resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "resource_group_name" {
  type = string
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
  default = "rg-adl-modules-test-01"
}

variable "rg_name_dns" {
  type = string
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}", var.rg_name_dns)) && can(regex("[\\w]+$", var.rg_name_dns))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
  default = "rg-adl-modules-test-01-global-dns"
}