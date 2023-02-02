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

variable "namespace_name" {
  type        = string
  description = "Specifies the name of the EventHub Namespace."
  validation {
    condition     = can(regex("^[a-zA-Z]+[-0-9a-zA-Z]*[0-9a-zA-Z]+$", var.namespace_name)) && length(var.namespace_name) >= 6 && length(var.namespace_name) <= 50
    error_message = "The namespace must be between 6 and 50 characters long, and can contain only letters, numbers, and hyphens. The namespace must start with a letter, and it must end with a letter or number"
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
    condition     = var.partition_count >= 1 && var.partition_count <= 32
    error_message = "Valid values for partition_count are in the range [1, 32]"
  }
  default = 2
}

variable "message_retention" {
  type        = number
  description = "Specifies the number of days to retain the events for this Event Hub."
  validation {
    condition     = var.message_retention >= 1 && var.message_retention <= 7
    error_message = "Valid values for message_retention are in the range [1, 7]"
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
