variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
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

variable "jumphost_username" {
  type        = string
  description = "VM username"
}

variable "jumphost_password" {
  type        = string
  description = "VM password"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the virtual machine"
}