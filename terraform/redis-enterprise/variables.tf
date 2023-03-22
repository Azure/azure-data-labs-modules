variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{1,57}", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename)) && !can(regex("[--]", var.basename))
    error_message = "The name must be between 1 and 57 characters and can contain only letters, numbers and hyphens. The last character must be a letter or number. The hyphen character must be immediately preceded and followed by a letter or number. Spaces are not allowed."
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
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "capacity" {
  type        = number
  description = "The size of the Redis cache to deploy."
  validation {
    condition     = var.capacity >= 2 && var.capacity <= 9 && floor(var.capacity) == var.capacity
    error_message = "Valid values for capacity are integers in the range [2, 9]."
  }
  default = 2
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Redis Cache."
  validation {
    condition     = contains(["enterprise_e10", "enterprise_e20", "enterprise_e50", "enterprise_e100", "enterpriseflash_f300", "enterpriseflash_f700", "enterpriseflash_f1500"], lower(var.sku_name))
    error_message = "Valid values for sku_name are \"Enterprise_E10\", \"Enterprise_E20\", \"Enterprise_E50\", \"Enterprise_E100\", \"EnterpriseFlash_F300\", \"EnterpriseFlash_F700\", \"EnterpriseFlash_F1500\"."
  }
  default = "Enterprise_E10"
}

variable "enable_non_ssl_port" {
  type        = bool
  description = "Enable the non-SSL port (6379) ."
  default     = false
}

variable "minimum_tls_version" {
  type        = string
  description = "The minimum TLS version."
  validation {
    condition     = contains(["1.0", "1.1", "1.2"], lower(var.minimum_tls_version))
    error_message = "Valid values for minimum_tls_version are \"1.0\", \"1.1\", or \"1.2\"."
  }
  default = "1.2"
}

variable "clustering_policy" {
  type        = string
  description = "Clustering policy - default is OSSCluster. Specified at create time."
  validation {
    condition     = contains(["enterprisecluster ", "osscluster"], lower(var.clustering_policy))
    error_message = "Valid values for clustering_policy are \"EnterpriseCluster\" or \"OSSCluster\"."
  }
  default = "OSSCluster"
}

variable "client_protocol" {
  type        = string
  description = "Specifies whether redis clients can connect using TLS-encrypted or plaintext redis protocols."
  validation {
    condition     = contains(["encrypted", "plaintext"], lower(var.client_protocol))
    error_message = "Valid values for client_protocol are \"Encrypted\" or \"PlainText\"."
  }
  default = "Encrypted"
}

variable "eviction_policy" {
  type        = string
  description = "Redis eviction policy."
  validation {
    condition     = contains(["allkeyslfu", "allkeyslru", "allkeysrandom", "volatilelru", "volatilelfu", "volatilettl", "volatilerandom", "noeviction"], lower(var.eviction_policy))
    error_message = "Valid values for eviction_policy are \"AllKeysLFU\", \"AllKeysLRU\", \"AllKeysRandom\", \"VolatileLRU\", \"VolatileLFU\", \"VolatileTTL\", \"VolatileRandom\", \"NoEviction\"."
  }
  default = "VolatileLRU"
}