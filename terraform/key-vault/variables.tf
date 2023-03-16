variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{1,21}$", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename))
    error_message = "The name must be between 1 and 21 characters, can contain only letters, numbers, and hyphens. Must end with a letter or number. Cannot contain consecutive hyphens."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
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

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "sku_name" {
  type        = string
  description = "The Name of the SKU used for this Key Vault."
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "Valid values for sku_name are \"standard\" or \"premium\"."
  }
  default = "standard"
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted."
  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90 && floor(var.soft_delete_retention_days) == var.soft_delete_retention_days
    error_message = "Valid values for soft_delete_retention_days are integers in the range [7, 90]."
  }
  default = 90
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = true
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  default     = false
}

variable "firewall_virtual_network_subnet_ids" {
  type        = list(string)
  description = "A list of virtual network subnet ids to to secure the storage account."
  default     = []
}

variable "firewall_default_action" {
  type        = string
  description = "Specifies the default action of allow or deny when no other rules match."
  validation {
    condition     = contains(["allow", "deny"], lower(var.firewall_default_action))
    error_message = "Valid values for firewall_default_action are \"Allow\" or \"Deny\"."
  }
  default = "Deny"
}

variable "firewall_ip_rules" {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format."
  validation {
    condition     = length(var.firewall_ip_rules) == 0 || alltrue([for v in var.firewall_ip_rules : can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))(\\/([0-9]|[12][0-9]|3[0-2]))?$", v))])
    error_message = "Invalid IP or IP range in CIDR format found in the list."
  }
  default = []
}

variable "firewall_bypass" {
  type        = string
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices."
  validation {
    condition     = contains(["azureservices", "none"], lower(var.firewall_bypass))
    error_message = "Valid values for firewall_bypass are \"AzureServices\" or \"None\"."
  }
  default = "AzureServices"
}