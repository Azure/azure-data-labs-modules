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

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
}

variable "capacity" {
  type        = number
  description = "The size of the Redis cache to deploy"
  default     = 2
}

variable "family" {
  type        = string
  description = "The SKU family/pricing group to use"
  default     = "C"
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Redis Cache"
  default     = "Standard"
}

variable "enable_non_ssl_port" {
  type        = bool
  description = "Enable the non-SSL port (6379) "
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
  default     = false
}

variable "minimum_tls_version" {
  type        = string
  description = "The minimum TLS version"
  default     = "1.2"
}