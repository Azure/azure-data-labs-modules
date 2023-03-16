variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w\\.]{0,75}$", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "The name of the virtual network peering must be between 0 and 75 characters and must end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.virtual_network_name)) && can(regex("^[0-9a-zA-Z]+", var.virtual_network_name)) && can(regex("[\\w]+$", var.virtual_network_name))
    error_message = "The name for the virtual network must be between 1 and 80 characters and must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "remote_virtual_network_id" {
  type        = string
  description = "The full Azure resource ID of the remote virtual network."
}

variable "allow_virtual_network_access" {
  type        = bool
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network."
  default     = true
}

variable "allow_forwarded_traffic" {
  type        = bool
  description = " Controls if forwarded traffic from VMs in the remote virtual network is allowed."
  default     = false
}

variable "allow_gateway_transit" {
  type        = bool
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  default     = false
}

variable "use_remote_gateways" {
  type        = bool
  description = "Controls if remote gateways can be used on the local virtual network."
  default     = false
}