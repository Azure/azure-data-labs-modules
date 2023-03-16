variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "name" {
  type        = string
  description = "The name of the security rule."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.name)) && can(regex("^[0-9a-zA-Z]+", var.name)) && can(regex("[\\w]+$", var.name))
    error_message = "The name must be between 1 and 80 characters, must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "priority" {
  type        = number
  description = "Specifies the priority of the rule."
}

variable "direction" {
  type        = string
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic."
}

variable "access" {
  type        = string
  description = "Specifies whether network traffic is allowed or denied."
}

variable "protocol" {
  type        = string
  description = "Network protocol this rule applies to."
}

variable "source_port_range" {
  type        = string
  description = "List of source ports or port ranges."
}

variable "destination_port_range" {
  type        = string
  description = "List of destination ports or port ranges."
  default     = "Destination Port or Range"
}

variable "source_address_prefix" {
  type        = string
  description = "CIDR or destination IP range or * to match any IP."
}

variable "destination_address_prefix" {
  type        = string
  description = "List of destination address prefixes."
}

variable "network_security_group_name" {
  type        = string
  description = "The name of the Network Security Group that we want to attach the rule to."
}