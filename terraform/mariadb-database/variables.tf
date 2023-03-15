variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[0-9a-z]{0,48}$", var.basename)) && !can(regex("-$", var.basename))
    error_message = "The name must be between 0 and 48 characters,can only contain lowercase letters, numbers, and hyphens. Cannot end with a hyphen."
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

variable "administrator_login" {
  type        = string
  description = "The Administrator login for the MariaDB Server."
  default     = "sqladminuser"
}

variable "administrator_login_password" {
  type        = string
  description = "The Password associated with the administrator_login."
  default     = "ThisIsNotVerySecure!"
  sensitive   = true
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this MariaDB Server."
  default     = "GP_Gen5_2"
}

variable "storage_mb" {
  type        = number
  description = "Max storage allowed for a server."
  validation {
    condition     = var.storage_mb >= 5120 && var.storage_mb <= 4096000 && floor(var.storage_mb) == var.storage_mb
    error_message = "Valid values for storage_mb are integers in the range [5120, 4096000] for General Purpose and Memory Optimized SKUs. For Basic SKU is resticted further to the range [5120, 1024000]."
  }
  default = 5120
}

variable "ver" {
  type        = string
  description = "Specifies the version of MariaDB to use."
  validation {
    condition     = contains(["10.2", "10.3"], var.ver)
    error_message = "Valid values for ver are \"10.2\" or \"10.3\"."
  }
  default = "10.3"
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

variable "ssl_enforcement_enabled" {
  type        = bool
  description = "Specifies if SSL should be enforced on connections."
  default     = true
}

variable "charset" {
  type        = string
  description = "Specifies the Charset for the MariaDB Database."
  default     = "utf8mb4"
}

variable "collation" {
  type        = string
  description = "Specifies the Collation for the MariaDB Database."
  default     = "utf8mb4_unicode_520_ci"
}