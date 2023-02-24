variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[0-9a-zA-Z]{0,10}$", var.basename))
    error_message = "Name must be between 0 and 10 characters, must contain only letters and numbers."
  }
}

variable "synapse_workspace_id" {
  type        = string
  description = "The ID of the Synapse workspace."
}

variable "node_size_family" {
  type        = string
  description = "The kind of nodes that the Spark Pool provides."
  validation {
    condition     = contains(["memoryoptimized", "none"], lower(var.node_size_family))
    error_message = "Valid values for sku_name are \"MemoryOptimized\", or \"None\"."
  }
  default = "MemoryOptimized"
}

variable "node_size" {
  type        = string
  description = "The level of node in the Spark Pool."
  validation {
    condition     = contains(["small", "medium", "large", "none", "xlarge", "xxlarge", "xxxlarge"], lower(var.node_size))
    error_message = "Valid values for sku_name are \"Small\", \"Medium\", \"Large\", \"None\", \"XLarge\", \"XXLarge\", or \"XXXLarge\"."
  }
  default = "Small"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}