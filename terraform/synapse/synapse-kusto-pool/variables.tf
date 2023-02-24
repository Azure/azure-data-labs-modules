variable "basename" {
  type        = string
  description = "Basename of the module."
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

variable "synapse_workspace_id" {
  type        = string
  description = "The ID of the Synapse workspace."
}

variable "synapse_workspace_uid" {
  type        = string
  description = "The UID of the Synapse workspace."
}

variable "enable_purge" {
  type    = bool
  default = false
}

variable "enable_streaming_ingest" {
  type    = bool
  default = false
}

variable "optimized_autoscale_enabled" {
  type    = bool
  default = false
}

variable "optimized_autoscale_maximum" {
  type    = number
  default = 1
}

variable "optimized_autoscale_minimum" {
  type    = number
  default = 1
}

variable "optimized_autoscale_version" {
  type    = number
  default = 1
}

variable "sku_capacity" {
  type    = number
  default = 2
}

variable "sku_name" {
  type    = string
  default = "Compute optimized"
}

variable "sku_size" {
  type    = string
  default = "Small"
}