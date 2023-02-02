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
  description = "Location of the resource group."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

variable "cluster_name" {
  type        = string
  description = "Specifies the name of the Kusto Cluster this database will be added to."
}

variable "hot_cache_period" {
  type        = string
  description = "The time the data that should be kept in cache for fast queries as ISO 8601 timespan."
  validation {
    condition     = length(var.hot_cache_period) == 0 || can(regex("P(?:(?:\\d+D|\\d+M(?:\\d+D)?|\\d+Y(?:\\d+M(?:\\d+D)?)?)(?:T(?:\\d+H(?:\\d+M(?:\\d+S)?)?|\\d+M(?:\\d+S)?|\\d+S))?|T(?:\\d+H(?:\\d+M(?:\\d+S)?)?|\\d+M(?:\\d+S)?|\\d+S)|\\d+W)", var.hot_cache_period))
    error_message = "Valid values for hot_cache_period are durations expressed as per the ISO 8601 standard (https://en.wikipedia.org/wiki/ISO_8601#Durations)"
  }
  default = "P7D"
}




variable "soft_delete_period" {
  type        = string
  description = "The time the data should be kept before it stops being accessible to queries as ISO 8601 timespan."
  validation {
    condition     = length(var.soft_delete_period) == 0 || can(regex("P(?:(?:\\d+D|\\d+M(?:\\d+D)?|\\d+Y(?:\\d+M(?:\\d+D)?)?)(?:T(?:\\d+H(?:\\d+M(?:\\d+S)?)?|\\d+M(?:\\d+S)?|\\d+S))?|T(?:\\d+H(?:\\d+M(?:\\d+S)?)?|\\d+M(?:\\d+S)?|\\d+S)|\\d+W)", var.soft_delete_period))
    error_message = "Valid values for soft_delete_period are durations expressed as per the ISO 8601 standard (https://en.wikipedia.org/wiki/ISO_8601#Durations)"
  }
  default = "P31D"
}