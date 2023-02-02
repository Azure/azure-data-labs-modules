variable "basename" {
  type        = string
  description = "Basename of the module."
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

variable "virtual_machine_size" {
  type        = string
  description = "The Virtual Machine Size."
  default     = "STANDARD_DS2_V2"
}

variable "authorization_type" {
  type        = string
  description = "The Compute Instance Authorization type."
  default     = "personal"
}

variable "module_enabled" {
  description = "Variable to enable or disable AML compute instance."
  default     = true
}