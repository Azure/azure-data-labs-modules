variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{0,60}$", var.basename))
    error_message = "The name must be between 0 and 60 characters, can contain only alphanumeric characters, underscores, and hyphens."
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

variable "identity_ids" {
  type        = list(string)
  description = "Specifies the IDs of the User Assigned Managed Identities to be assigned to the Databricks Access Connector. Only one User Assigned Managed Identity ID is supported per Databricks Access Connector resource."
  default     = []
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
