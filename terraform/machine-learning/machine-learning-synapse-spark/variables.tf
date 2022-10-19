variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "name" {
  type        = string
  description = "The name which should be used for this Machine Learning Compute Instance"
  default     = "mlqss001"
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

variable "machine_learning_workspace_id" {
  type        = string
  description = "The ID of the Machine Learning workspace"
}

variable "synapse_spark_pool_id" {
  type        = string
  description = "The ID of the Synapse Spark pool"
}

variable "module_enabled" {
  description = "Variable to enable or disable AML synapse spark"
  default     = false
}