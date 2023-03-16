variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[0-9a-zA-Z]{0,60}", var.basename))
    error_message = "The name must be between 0 and 60, and can only contain lowercase letters or numbers."
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

variable "sku_name" {
  type        = string
  description = "Sets the PowerBI Embedded's pricing level's SKU."
  validation {
    condition     = contains(["a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8"], lower(var.sku_name))
    error_message = "Valid values for sku_name are \"A1\", \"A2\", \"A3\", \"A4\", \"A5\", \"A6\", \"A7\", \"A8\"."
  }
  default = "A1"
}

variable "administrators" {
  type        = list(string)
  description = "A set of administrator user identities, which manages the Power BI Embedded and must be a member user or a service principal in your AAD tenant."
  validation {
    condition     = length(var.administrators) == 0 || alltrue([for v in var.administrators : can(regex("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", v))])
    error_message = "Invalid email addresses found in the list."
  }
}

variable "mode" {
  type        = string
  description = "Sets the PowerBI Embedded's mode."
  validation {
    condition     = contains(["gen1", "gen2"], lower(var.mode))
    error_message = "Valid values for sku_name are \"Gen1\", or \"Gen2\"."
  }
  default = "Gen1"
}