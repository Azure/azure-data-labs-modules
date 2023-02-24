variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,75}$", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "The name must be between 1 and 75 characters, must end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
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

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the bastion."
}

variable "sku" {
  type        = string
  description = "The SKU of the Bastion Host."
  validation {
    condition     = contains(["basic", "standard"], lower(var.sku))
    error_message = "Valid values for sku are \"Basic\" or \"Standard\"."
  }
  default = "Standard"
}

variable "copy_paste_enabled" {
  type        = bool
  description = "Is Copy/Paste feature enabled for the Bastion Host?"
  default     = false
}

variable "file_copy_enabled" {
  type        = bool
  description = "Is File Copy feature enabled for the Bastion Host?"
  default     = false
}