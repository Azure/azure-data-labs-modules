variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "synapse_workspace_id" {
  type        = string
  description = "The ID of the Synapse workspace"
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Synapse Sql Pool"
  default     = "DW100c"
}

variable "create_mode" {
  type        = string
  description = "Specifies how to create the Sql Pool"
  default     = "Default"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable Synapse Dedicated SQL pool deployment"
  default     = true
}