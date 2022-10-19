variable "name" {
  type        = string
  description = "The name which should be used for this Machine Learning Compute Cluster"
  default     = "cpu-cluster"
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

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
}

variable "vm_priority" {
  type        = string
  description = "The priority of the VM"
  default     = "LowPriority"
}

variable "vm_size" {
  type        = string
  description = "The size of the VM"
  default     = "STANDARD_DS2_V2"
}

variable "module_enabled" {
  description = "Variable to enable or disable AML compute cluster"
  default     = false
}