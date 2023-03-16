variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[0-9a-z]{1,61}$", var.basename))
    error_message = "The name must be between 1 and 61 characters, and can contain lowercase letters and numbers only."
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
  description = "The SKU for the Analysis Services Server."
  validation {
    condition     = contains(["d1", "b1", "b2", "s0", "s1", "s2", "s4", "s8", "s9", "s8v2", "s9v2"], lower(var.sku))
    error_message = "Valid values for sku are \"D1\", \"B1\", \"B2\", \"S0\", \"S1\", \"S2\", \"S4\", \"S8\", \"S9\", \"S8v2\", \"S9v2\"."
  }
  default = "S0"
}

variable "enable_power_bi_service" {
  type        = bool
  description = "Indicates if the Power BI service is allowed to access or not."
  default     = true
}

variable "admin_users" {
  type        = list(string)
  description = "List of email addresses of admin user."
  validation {
    condition     = length(var.admin_users) == 0 || alltrue([for v in var.admin_users : can(regex("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", v))])
    error_message = "Invalid email addresses found in the list."
  }
  default = []
}