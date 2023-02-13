variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{1,21}$", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename))
    error_message = "The name must be between 1 and 21 characters, can contain only letters, numbers, and hyphens. Must end with a letter or number. Cannot contain consecutive hyphens."
  }
}

variable "rg_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.rg_name)) && can(regex("[-\\w\\(\\)]+$", var.rg_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
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

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "sku_name" {
  type        = string
  description = "(Required) SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet. Changing this forces a new resource to be created."
  validation {
    condition     = contains(["azfw_hub", "azfw_vnet"], lower(var.sku_name))
    error_message = "Valid values for sku_name are \"AZFW_Hub\" or \"AZFW_VNet\"."
  }
  default = "AZFW_VNet"
}

variable "sku_tier" {
  type        = string
  description = "(Required) SKU tier of the Firewall. Possible values are Premium, Standard and Basic."
  validation {
    condition     = contains(["premium", "basic", "standard"], lower(var.sku_tier))
    error_message = "Valid values for sku_tier are \"Premium\", \"Standard\" or \"Basic\"."
  }
  default = "Standard"
}

variable "zones" {
  type        = list(string)
  description = "(Optional) Specifies a list of Availability Zones in which this Azure Firewall should be located. Changing this forces a new Azure Firewall to be created."
  default     = []
}

variable "threat_intel_mode" {
  type        = string
  description = "(Optional) The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert and Deny. Defaults to Alert."
  validation {
    condition     = contains(["off", "alert", "deny"], lower(var.threat_intel_mode))
    error_message = "Valid values for sku_tier are \"Off\", \"Alert\" or \"Deny\"."
  }
  default = "Alert"
}