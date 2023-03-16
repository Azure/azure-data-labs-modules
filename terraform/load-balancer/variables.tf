variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\.\\w]{0,77}$", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "The name must be between 0 and 77 characters, must end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
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

variable "location" {
  type        = string
  description = "Location of the resource group."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "sku" {
  type        = string
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic. Changing this forces a new resource to be created."
  validation {
    condition     = contains(["basic", "standard", "gateway"], lower(var.sku))
    error_message = "Valid values for sku are \"Basic\", \"Standard\" or \"Gateway\"."
  }
  default = "Basic"
}

variable "pip_allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  validation {
    condition     = contains(["static", "dynamic"], lower(var.pip_allocation_method))
    error_message = "Valid values for pip_allocation_method are \"Static\" or \"Dynamic\"."
  }
  default = "Static"
}

variable "pip_sku" {
  type        = string
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. Changing this forces a new resource to be created."
  validation {
    condition     = contains(["basic", "standard"], lower(var.pip_sku))
    error_message = "Valid values for pip_sku are \"Basic\" or \"Standard\"."
  }
  default = "Basic"
}