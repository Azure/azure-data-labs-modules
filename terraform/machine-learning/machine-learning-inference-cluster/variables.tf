variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{0,11}$", var.basename))
    error_message = "The name must be between 0 and 11 characters, can contain only letters, numbers, hyphens."
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

variable "kubernetes_cluster_id" {
  type        = string
  description = "The ID of the Kubernestes cluster."
}

variable "cluster_purpose" {
  type        = string
  description = "The purpose of the Inference Cluster."
  validation {
    condition     = contains(["devtest", "denseprod", "fastprod"], lower(var.cluster_purpose))
    error_message = "Valid values for cluster_purpose are \"DevTest\", \"DenseProd\", or \"FastProd\"."
  }
  default = "FastProd"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}