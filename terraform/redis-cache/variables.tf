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

variable "capacity" {
  type        = number
  description = "The size of the Redis cache to deploy."
  validation {
    condition     = var.capacity >= 0 && var.capacity <= 5 && floor(var.capacity) == var.capacity
    error_message = "Valid values for capacity are integers in the range [0, 6] for Basic and Standard Cache sizes and [1,5] for Premium."
  }
  default = 2
}

variable "family" {
  type        = string
  description = "The SKU family/pricing group to use."
  validation {
    condition     = contains(["c", "p"], lower(var.family))
    error_message = "Valid values for family are \"C\" (for Basic/Standard SKU family), or \"P\" (for Premium)."
  }
  default = "C"
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Redis Cache."
  validation {
    condition     = contains(["basic", "standard", "premium"], lower(var.sku_name))
    error_message = "Valid values for sku_name are \"Basic\", \"Standard\", or \"Premium\"."
  }
  default = "Standard"
}

variable "enable_non_ssl_port" {
  type        = bool
  description = "Enable the non-SSL port (6379) ."
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server."
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