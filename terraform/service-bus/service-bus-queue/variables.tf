variable "basename" {
  type        = string
  description = "Basename of the module."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "namespace_id" {
  type        = string
  description = "The ID of the Service Bus namespace."
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

variable "enable_partitioning" {
  type        = bool
  description = "Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers."
  default     = false
}