variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = !can(regex("^[0-9]*$", var.basename)) && !can(regex("[\\/\"[\\]:|<>+=;,?\\*@&\\s]+", var.basename))
    error_message = "Windows VM names must be between 1 and 64 characters, they cannot contain only numbers, neither they can contain special characters \\/\"[]:|<>+=;,?*@&, whitespace, or begin with '_' or end with '.' or '-'."
  }
  default = ""
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
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "jumphost_username" {
  type        = string
  description = "VM username."
}

variable "jumphost_password" {
  type        = string
  description = "VM password."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the virtual machine."
}