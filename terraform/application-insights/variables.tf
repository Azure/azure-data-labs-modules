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

variable "application_type" {
  type        = string
  description = "Specifies the type of Application Insights to create"
  default     = "web"
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = "Should the Application Insights component support ingestion over the Public Internet?"
  default     = false
}

variable "internet_query_enabled" {
  type        = bool
  description = "Should the Application Insights component support querying over the Public Internet?"
  default     = false
}