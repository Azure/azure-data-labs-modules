variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{0,249}", var.basename)) && can(regex("[-\\w\\(\\)]+$", var.basename))
    error_message = "The name must be between 0 and 249 characters, only allows alphanumeric characters, periods, underscores, hyphens and parenthesis and cannot end in a period."
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

variable "application_type" {
  type        = string
  description = "Specifies the type of Application Insights to create."
  validation {
    condition     = contains(["ios", "java", "mobilecenter", "node.js", "other", "phone", "store", "web"], lower(var.application_type))
    error_message = "Valid values for application_type are \"ios\", \"java\", \"MobileCenter\", \"Node.JS\", \"other\", \"phone\", \"store\", \"web\"."
  }
  default = "web"
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