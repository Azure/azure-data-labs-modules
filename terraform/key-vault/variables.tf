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

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
  default     = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
  default     = []
}

variable "sku_name" {
  type        = string
  description = "The Name of the SKU used for this Key Vault"
  validation {
    condition = contains(["standard", "premium"], var.sku_name)
    error_message = "Valid values for SKU are \"standard\" or \"premium\""
  }
  default     = "standard"
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "value"
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted"
  validation {
    condition = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "Valid values for soft_delete_retention_days are in the range [7, 90]"
  }
  default     = 90
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = true
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault"
  default     = false
}

variable "firewall_virtual_network_subnet_ids" {
  type        = list(string)
  description = "A list of virtual network subnet ids to to secure the storage account"
  default     = []
}

variable "firewall_default_action" {
  type        = string
  description = "Specifies the default action of allow or deny when no other rules match"
  validation {
    condition = contains(["Allow", "Deny"], var.firewall_default_action)
    error_message = "Valid values for firewall_default_action are \"Allow\" or \"Deny\""
  }
  default     = "Deny"
}

variable "firewall_ip_rules" {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format"
  default     = []
}

variable "firewall_bypass" {
  type        = string
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices"
  validation {
    condition = contains(["AzureServices", "None"], var.firewall_bypass)
    error_message = "Valid values for firewall_bypass are \"AzureServices\" or \"None\""
  }
  default     = "AzureServices"
}