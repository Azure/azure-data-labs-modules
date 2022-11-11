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

variable "machine_learning_workspace_id" {
  type        = string
  description = "The ID of the Machine Learning workspace"
}

variable "kubernetes_cluster_id" {
  type        = string
  description = "The ID of the Kubernestes cluster"
}

variable "cluster_purpose" {
  type        = string
  description = "The purpose of the Inference Cluster"
  default     = "FastProd"
}

variable "module_enabled" {
  description = "Variable to enable or disable AML synapse spark"
  default     = false
}