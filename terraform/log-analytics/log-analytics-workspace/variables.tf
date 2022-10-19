variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource"
}

variable "sku" {
  type        = string
  description = "Specifies the Sku of the Log Analytics Workspace"
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The workspace data retention in days"
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
  type        = number
  default     = -1
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