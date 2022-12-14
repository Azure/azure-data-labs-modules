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

variable "sku_name" {
  type        = string
  description = "Sets the PowerBI Embedded's pricing level's SKU"
  default     = "A1"
}

variable "administrators" {
  type        = list(string)
  description = "A set of administrator user identities, which manages the Power BI Embedded and must be a member user or a service principal in your AAD tenant"
}

variable "mode" {
  type        = string
  description = "Sets the PowerBI Embedded's mode"
  default     = "Gen1"
}