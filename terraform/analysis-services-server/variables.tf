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
}

variable "sku" {
  type        = string
  description = "SKU for the Analysis Services Server"
  default     = "S0"
}

variable "enable_power_bi_service" {
  type        = bool
  description = "Indicates if the Power BI service is allowed to access or not"
  default     = true
}

variable "admin_users" {
  type        = list(string)
  description = "List of email addresses of admin user"
  default     = []
}