variable "basename" {
  type        = string
  description = "Basename of the module."
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