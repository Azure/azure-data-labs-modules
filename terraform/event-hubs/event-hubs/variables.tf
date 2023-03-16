variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,252}$", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename))
    error_message = "The name must be between 1 and 252 characters, can contain only letters, numbers, periods, hyphens and underscores. Must end with a letter or number."
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

variable "namespace_name" {
  type        = string
  description = "Specifies the name of the EventHub Namespace."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{6,50}$", var.namespace_name)) && can(regex("^[a-zA-Z]+", var.namespace_name)) && can(regex("[0-9a-zA-Z]+$", var.namespace_name))
    error_message = "The namespace must be between 6 and 50 characters long, and can contain only letters, numbers, and hyphens. The namespace must start with a letter, and it must end with a letter or number."
  }
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "partition_count" {
  type        = number
  description = "Specifies the current number of shards on the Event Hub."
  validation {
    condition     = var.partition_count >= 1 && var.partition_count <= 32 && floor(var.partition_count) == var.partition_count
    error_message = "Valid values for partition_count are integers in the range [1, 32]."
  }
  default = 2
}

variable "message_retention" {
  type        = number
  description = "Specifies the number of days to retain the events for this Event Hub."
  validation {
    condition     = var.message_retention >= 1 && var.message_retention <= 7 && floor(var.message_retention) == var.message_retention
    error_message = "Valid values for message_retention are integers in the range [1, 7]."
  }
  default = 1
}

variable "listen" {
  type        = bool
  description = " Grants listen access to this this Authorization Rule."
  default     = true
}

variable "send" {
  type        = bool
  description = "Grants send access to this this Authorization Rule."
  default     = true
}

variable "manage" {
  type        = bool
  description = "Grants manage access to this this Authorization Rule."
  default     = false
}