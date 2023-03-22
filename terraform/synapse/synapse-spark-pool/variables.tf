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

variable "cache_size" {
  type        = number
  description = "(Optional) The cache size in the Spark Pool."
  default     = 100
}

variable "spark_version" {
  type        = number
  description = "(Optional) The Apache Spark version. Possible values are 2.4 , 3.1 , 3.2 and 3.3. Defaults to 2.4."
  validation {
    condition     = contains([2.4, 3.1, 3.2, 3.3], var.spark_version)
    error_message = "Valid values for spark_version are 2.4, 3.1, 3.2 and 3.3."
  }
  default = 2.4
}