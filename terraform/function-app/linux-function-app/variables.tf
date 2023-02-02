variable "basename" {
  type        = string
  description = "Basename of the module."
}

variable "rg_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{0,89}[^\\.]{1}$", var.rg_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)"
  }
}

variable "location" {
  type        = string
  description = "The Azure Region where the resource should exist."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the deployed resource."
  default     = {}
}

variable "storage_account_name" {
  type        = string
  description = "The backend storage account name which will be used by this Function App."
  validation {
    condition     = can(regex("^[0-9a-z]{3,24}$", var.storage_account_name))
    error_message = "Valid values for storage_account_name must be between 3 and 24 characters and can contain only lowercase letters and numbers"
  }
}

variable "storage_account_access_key" {
  type        = string
  description = "The access key which will be used to access the backend storage account for the Function App. Conflicts with storage_uses_managed_identity."
}

variable "service_plan_id" {
  type        = string
  description = "The ID of the App Service Plan within which to create this Function App."
}

variable "enabled" {
  type        = bool
  description = "Is the Function App enabled? Defaults to true."
  default     = true
}

variable "https_only" {
  type        = bool
  description = "Can the Function App only be accessed via HTTPS? Defaults to false."
  default     = false
}

variable "client_certificate_enabled" {
  type        = bool
  description = "Should the function app use Client Certificates."
  default     = false
}

variable "virtual_network_subnet_id" {
  type        = string
  description = "The subnet id which will be used by this Function App for regional virtual network integration."
  default     = null
}