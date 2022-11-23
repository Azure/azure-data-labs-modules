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

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
  default = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
  default = [ ]
}

variable "administrator_login" {
  type        = string
  description = "The Administrator login for the MariaDB Server"
  default     = "sqladminuser"
}

variable "administrator_login_password" {
  type        = string
  description = "The Password associated with the administrator_login"
  default     = "ThisIsNotVerySecure!"
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this MariaDB Server"
  default     = "GP_Gen5_2"
}

variable "storage_mb" {
  type        = number
  description = "Max storage allowed for a server"
  default     = 5120
}

variable "ver" {
  type        = string
  description = "Specifies the version of MariaDB to use"
  default     = "10.3"
}

variable "auto_grow_enabled" {
  type        = bool
  description = "Enable/Disable auto-growing of the storage"
  default     = true
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention days for the server"
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "Turn Geo-redundant server backups on/off"
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
  default     = false
}

variable "ssl_enforcement_enabled" {
  type        = bool
  description = "Specifies if SSL should be enforced on connections"
  default     = true
}

variable "charset" {
  type        = string
  description = "Specifies the Charset for the MariaDB Database"
  default     = "utf8mb4"
}

variable "collation" {
  type        = string
  description = "Specifies the Collation for the MariaDB Database"
  default     = "utf8mb4_unicode_520_ci"
}