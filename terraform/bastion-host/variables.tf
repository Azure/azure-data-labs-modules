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

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the bastion"
}

variable "sku" {
  type        = string
  description = "The SKU of the Bastion Host"
  default     = "Standard"
}

variable "copy_paste_enabled" {
  type        = bool
  description = "Is Copy/Paste feature enabled for the Bastion Host"
  default     = false
}

variable "file_copy_enabled" {
  type        = bool
  description = "Is File Copy feature enabled for the Bastion Host"
  default     = false
}