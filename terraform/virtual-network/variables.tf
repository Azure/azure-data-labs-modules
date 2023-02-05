variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,75}$", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "The name for the virtual network must be between 1 and 80 characters and must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "rg_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}", var.rg_name)) && can(regex("[\\w]+$", var.rg_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "location" {
  type        = string
  description = "Location of the resource group."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the deployed resource."
  default     = {}
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network."
  validation {
    condition     = length(var.address_space) == 0 || alltrue([for v in var.address_space : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2])){1}$", v))])
    error_message = "Invalid IP range in CIDR format found in the list."
  }
}

variable "dns_servers" {
  type        = list(string)
  description = "List of DNS servers to use for virtual network."
  validation {
    condition     = length(var.dns_servers) == 0 || alltrue([for v in var.dns_servers : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2])){1}$", v))])
    error_message = "Invalid IP range in CIDR format found in the list."
  }
  default = []
}

variable "ddos_protection_plan" {
  description = "A ddos_protection_plan id ."
  type        = map(string)
  default     = {}
}