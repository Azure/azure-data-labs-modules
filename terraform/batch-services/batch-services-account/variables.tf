variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[0-9a-z]{0,12}$", var.basename))
    error_message = "The name must be between 0 and 12 characters, must only contain lowercase characters and numbers."
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

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "pool_allocation_mode" {
  type        = string
  description = "Specifies the mode to use for pool allocation."
  validation {
    condition     = contains(["batchservice", "usersubscription"], lower(var.pool_allocation_mode))
    error_message = "Valid values for pool_allocation are \"BatchService\" or \"UserSubscription\"."
  }
  default = "BatchService"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for the Batch Services Account."
  default     = false
}

variable "is_private_endpoint" {
  type        = bool
  description = "Whether private endpoints are enabled to access the resource."
  default     = true
}

variable "storage_account_id" {
  type        = string
  description = "Storage account ID for the Batch Service."
}

variable "allowed_authentication_modes" {
  type        = list(string)
  description = "Specifies the allowed authentication modes for the Batch account."
  validation {
    condition     = alltrue([for mode in var.allowed_authentication_modes : contains(["aad", "sharedkey", "taskauthenticationtoken"], lower(mode))])
    error_message = "Valid values for allowed_authentication_modes are \"AAD\", \"SharedKey\", \"TaskAuthenticationToken\"."
  }
  default = ["AAD", "SharedKey", "TaskAuthenticationToken"]
}
