variable "rg_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.rg_name)) && can(regex("[-\\w\\(\\)]+$", var.rg_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "name" {
  type        = string
  description = "The name of the Route."
}

variable "route_table_name" {
  type        = string
  description = "The name of the route table within which create the route."
}

variable "address_prefix" {
  type        = string
  description = "The destination to which the route applies."
}

variable "next_hop_type" {
  type        = string
  description = "The type of Azure hop the packet should be sent to."
}