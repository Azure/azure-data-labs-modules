variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-.\\w]{1,52}$", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "The name must be between 1 and 52 characters, must end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
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

variable "subnet_id" {
  type        = string
  description = "(Optional) Reference to the subnet associated with the IP Configuration."
  default     = null
}

variable "management_subnet_id" {
  type        = string
  description = "(Required) Reference to the subnet associated with the IP Configuration. Changing this forces a new resource to be created. The Management Subnet used for the Firewall must have the name AzureFirewallManagementSubnet and the subnet mask must be at least a /26."
  default     = null
}

variable "public_ip_count" {
  type        = number
  description = "(Optional) Specifies the number of public IPs to assign to the Firewall. Defaults to 1."
  default     = 1
}

variable "pip_allocation_method" {
  type        = string
  description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  validation {
    condition     = contains(["static", "dynamic"], lower(var.pip_allocation_method))
    error_message = "Valid values for pip_allocation_method are \"Static\" or \"Dynamic\"."
  }
  default = "Static"
}

variable "pip_sku" {
  type        = string
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. Changing this forces a new resource to be created."
  validation {
    condition     = contains(["basic", "standard"], lower(var.pip_sku))
    error_message = "Valid values for pip_sku are \"Basic\" or \"Standard\"."
  }
  default = "Standard"
}

variable "sku_policy" {
  type        = string
  description = "(Optional) The SKU Tier of the Firewall Policy. Possible values are Standard, Premium. Changing this forces a new Firewall Policy to be created."
  validation {
    condition     = contains(["Premium", "Standard"], var.sku_policy)
    error_message = "Valid values for sku_policy are \"Premium\" or \"Standard\"."
  }
  default = "Standard"
}

variable "proxy_enabled" {
  type        = bool
  description = "(Optional) Whether to enable DNS proxy on Firewalls attached to this Firewall Policy? Defaults to false."
  default     = false
}

variable "dns_servers" {
  type        = list(string)
  description = "(Optional) A list of custom DNS servers' IP addresses."
  default     = null
}