variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{0,125}$", var.basename)) && can(regex("[-\\w\\(\\)]+$", var.basename))
    error_message = "Name must be between 0 and 125 characters,  can only include alphanumeric, underscore, and hyphen."
  }
}

variable "rg_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.rg_name)) && can(regex("[-\\w\\(\\)]+$", var.rg_name))
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