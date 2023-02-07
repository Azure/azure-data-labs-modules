variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{0,28}$", var.basename))
    error_message = "The name must be between 0 and 283 characters, can contain only letters, numbers, hyphens, and underscores."
  }
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

variable "machine_learning_workspace_id" {
  type        = string
  description = "The ID of the Machine Learning workspace."
}

variable "synapse_spark_pool_id" {
  type        = string
  description = "The ID of the Synapse Spark pool."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}