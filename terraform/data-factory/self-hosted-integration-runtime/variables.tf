variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{1,256}$", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename))
    error_message = "The name must be between 1 and 256 characters, can contain only letters, numbers and hyphens. The last character must be a letter or number. Spaces are not allowed."
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
  description = "A mapping of tags which should be assigned to the deployed resource."
  default     = {}
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "vnet_id" {
  type        = string
  description = "The ID of the virtual network to which the private DNS zones will be linked to."
  default     = ""
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "data_factory_id" {
  type        = string
  description = "The name of the data factory."
  # TODO: Include validation
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account needed for configuration."
  # TODO: Include validation
}

variable "storage_account_access_key" {
  type        = string
  description = "The key of the storage account needed for configuration."
  # TODO: Include validation
}

variable "virtual_machine_user" {
  type        = string
  description = "The user for the virtual machine."
  default     = "azureuser"
}

variable "virtual_machine_password" {
  type        = string
  description = "The password of the virtual machine."
  default     = "ThisIsNotVerySecure!"
}
