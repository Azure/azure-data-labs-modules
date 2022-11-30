variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "synapse_workspace_id" {
  type        = string
  description = "The ID of the Synapse workspace"
}

variable "node_size_family" {
  type        = string
  description = "The kind of nodes that the Spark Pool provides"
  default     = "MemoryOptimized"
}

variable "node_size" {
  type        = string
  description = "The level of node in the Spark Pool"
  default     = "Small"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable Synapse Spark pool deployment"
  default     = true
}
