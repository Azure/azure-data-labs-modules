variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{0,27}$", var.basename))
    error_message = "The name must be between 0 and 27 characters, can contain only letters, numbers, hyphens."
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

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
}

variable "vm_priority" {
  type        = string
  description = "The priority of the VM."
  validation {
    condition     = contains(["dedicate", "lowpriority"], lower(var.vm_priority))
    error_message = "Valid values for vm_priority are \"Dedicated\", or \"LowPriority\"."
  }
  default = "LowPriority"
}

variable "vm_size" {
  type        = string
  description = "The size of the VM."
  default     = "Standard_DS2_v2"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}