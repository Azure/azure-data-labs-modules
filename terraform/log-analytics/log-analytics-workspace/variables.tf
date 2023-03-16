variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{1,59}$", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename))
    error_message = "The name must be between 1 and 59 characters, can contain only letters, numbers, and hyphens. Must end with a letter or number."
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
  description = "Specifies the Sku of the Log Analytics Workspace."
  validation {
    condition     = contains(["free", "pernode", "premium", "standard", "standalone", "unlimited", "capacityreservation", "pergb2018"], lower(var.sku))
    error_message = "Valid values for sku are \"Free\", \"PerNode\", \"Premium\", \"Standard\", \"Standalone\", \"Unlimited\", \"CapacityReservation\", \"PerGB2018\"."
  }
  default = "PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days."
  validation {
    condition     = var.retention_in_days == 7 || (var.retention_in_days >= 30 && var.retention_in_days <= 730)
    error_message = "Valid values for retention_in_days are in the range [30, 730]. For Free Tier only the valid value is 7."
  }
  default = 30
}

variable "daily_quota_gb" {
  type        = number
  description = "The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
  validation {
    condition     = var.daily_quota_gb == -1 || var.daily_quota_gb >= 0.023
    error_message = "Valid values for daily_quota_gb are in the range [0.023, +inf]. -1 means Unlimited."
  }
  default = -1
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = "Should the Log Analytics Workflow support ingestion over the Public Internet?"
  default     = false
}

variable "internet_query_enabled" {
  type        = bool
  description = "Should the Log Analytics Workflow support querying over the Public Internet?"
  default     = false
}