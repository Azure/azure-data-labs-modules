variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{0,19}$", var.basename)) && !can(regex("-[0-9]$", var.basename))
    error_message = "The name must be between 0 and 19 characters, can contain only letters, numbers, hyphens. Cannot end with a hyphen or a hyphen followed by a number."
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

variable "virtual_machine_size" {
  type        = string
  description = "The Virtual Machine Size."
  default     = "STANDARD_DS2_V2"
}

variable "authorization_type" {
  type        = string
  description = "The Compute Instance Authorization type."
  validation {
    condition     = contains(["personal"], lower(var.authorization_type))
    error_message = "Valid values for authorization_type are \"personal\"."
  }
  default = "personal"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}