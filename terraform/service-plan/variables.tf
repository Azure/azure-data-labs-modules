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

variable "os_type" {
  type        = string
  description = "The O/S type for the App Services to be hosted in this plan"
  default     = "Linux"
}

variable "sku_name" {
  type        = string
  description = "The SKU for the plan. Possible values include"
  default     = "Y1"
}