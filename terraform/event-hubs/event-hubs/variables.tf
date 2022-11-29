variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "namespace_name" {
  type        = string
  description = "Specifies the name of the EventHub Namespace"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = true
}

variable "partition_count" {
  type        = number
  description = "Specifies the current number of shards on the Event Hub"
  default     = 2
}

variable "message_retention" {
  type        = number
  description = "Specifies the number of days to retain the events for this Event Hub"
  default     = 1
}

variable "listen" {
  type        = bool
  description = " Grants listen access to this this Authorization Rule"
  default     = true
}

variable "send" {
  type        = bool
  description = "Grants send access to this this Authorization Rule"
  default     = true
}

variable "manage" {
  type        = bool
  description = "Grants manage access to this this Authorization Rule"
  default     = false
}
