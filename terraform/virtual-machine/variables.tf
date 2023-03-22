variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = !can(regex("[\\/\"[\\]:|<>+=;,?\\*@&\\s]+", var.basename)) && can(regex("[\\w]+$", var.basename)) && can(regex("^[\\S]{1,60}$", var.basename))
    error_message = "Windows VM names must be between 1 and 60 characters, they cannot contain special characters \\/\"[]:|<>+=;,?*@&, whitespace, or end with '.' or '-'."
  }
  default = ""
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

variable "is_private_endpoint" {
  type        = bool
  description = "Whether private endpoints are enabled to access the resource."
  default     = true
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
  sensitive   = true
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the virtual machine."
}

variable "storage_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "Storage image reference."
  default = {
    publisher = "microsoft-dsvm"
    offer     = "dsvm-win-2019"
    sku       = "server-2019"
    version   = "latest"
  }
}
