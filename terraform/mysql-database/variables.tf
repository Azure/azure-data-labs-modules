variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-z]{1,50}$", var.basename)) && can(regex("[0-9a-z]+$", var.basename))
    error_message = "The name must be between 1 and 50 characters, can only contain lowercase letters, numbers, and hyphens. Must not end with a hyphen."
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

variable "is_private_endpoint" {
  type        = bool
  description = "Whether private endpoints are enabled to access the resource."
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet delegated to MySQL for the service to be injected privately in that subnet."
  default     = ""
}

variable "private_dns_zone_id" {
  type        = string
  description = "Specifies the Private DNS Zone to include."
  default     = ""
}

variable "administrator_login" {
  type        = string
  description = "The Administrator login for the MySQL Server."
  default     = "sqladminuser"
}

variable "administrator_password" {
  type        = string
  description = "The Password associated with the administrator_login."
  default     = "ThisIsNotVerySecure!"
  sensitive   = true
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this MySQL Server."
  default     = "GP_Standard_D2ds_v4"
}

variable "storage_gb" {
  type        = number
  description = "Max storage allowed for this MySQL Server."
  validation {
    condition     = var.storage_gb >= 20 && var.storage_gb <= 16384 && floor(var.storage_gb) == var.storage_gb
    error_message = "Valid values for storage_gb are integers in the range [20, 16384]."
  }
  default = 64
}

variable "ver" {
  type        = string
  description = "Specifies the version of MySQL to use."
  validation {
    condition     = contains(["5.7", "8.0.21"], var.ver)
    error_message = "Valid values for ver are \"5.7\" or \"8.0.21\"."
  }
  default = "5.7"
}

variable "auto_grow_enabled" {
  type        = bool
  description = "Enable/Disable auto-growing of the storage."
  default     = true
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention days for the server."
  validation {
    condition     = var.backup_retention_days >= 7 && var.backup_retention_days <= 35 && floor(var.backup_retention_days) == var.backup_retention_days
    error_message = "Valid values for backup_retention_days are in the range [7, 35]."
  }
  default = 7
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "Turn Geo-redundant server backups on/off."
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server."
  default     = false
}

variable "charset" {
  type        = string
  description = "Specifies the Charset for the MySQL Database."
  default     = "utf8"
}

variable "collation" {
  type        = string
  description = "Specifies the Collation for the MySQL Database."
  default     = "utf8_unicode_ci"
}

variable "identity_ids" {
  type        = list(string)
  description = "Specifies the IDs of the User Assigned Managed Identities to be assigned to the MySQL Server."
  default     = []
}

variable "customer_managed_key" {
  type = map(
    object(
      {
        key_vault_key_id                  = optional(string)
        primary_user_assigned_identity_id = optional(string)
      }
    )
  )
  description = "Specifies the ID of the User Assigned Managed Identity to be used by MySQL Server to access the Customer Managed Key."
  validation {
    condition     = length(var.customer_managed_key) <= 1
    error_message = "customer_managed_key accepts, at most, one object."
  }
  default = {}
}