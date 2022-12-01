variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = true
}

variable "synapse_workspace_id" {
  type        = string
  description = "The ID of the Synapse workspace"
}