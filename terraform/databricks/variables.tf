variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{0,60}$", var.basename))
    error_message = "The name must be between 1 and 64 characters, can contain only alphanumeric characters, underscores, and hyphens."
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

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for the user access Private Endpoints."
  default     = ""
}

variable "backend_subnet_id" {
  type        = string
  description = "Only used when maximum_network_security is true. The ID of the subnet from which private IP addresses will be allocated for the backend Private Endpoint."
  default     = null
}

variable "public_network_enabled" {
  type        = bool
  description = "Should the Purview Account be visible to the public network?"
  default     = true
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "backend_private_dns_zone_ids" {
  type        = list(string)
  description = "Only used when maximum_network_security is true. Specifies the list of Private DNS Zones to include for the backend."
  default     = null
}

variable "sku" {
  type        = string
  description = "The sku to use for the Databricks Workspace."
  validation {
    condition     = contains(["standard", "premium", "trial"], lower(var.sku))
    error_message = "Valid values for sku are \"Standard\", \"Premium\", or \"Trial\"."
  }
  default = "premium"
}

variable "public_subnet_name" {
  type        = string
  description = "The name of the Public Subnet within the Virtual Network."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.public_subnet_name)) && can(regex("^[0-9a-zA-Z]+", var.public_subnet_name)) && can(regex("[\\w]+$", var.public_subnet_name))
    error_message = "The name for the subnet must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "private_subnet_name" {
  type        = string
  description = "The name of the Private Subnet within the Virtual Network."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.private_subnet_name)) && can(regex("^[0-9a-zA-Z]+", var.private_subnet_name)) && can(regex("[\\w]+$", var.private_subnet_name))
    error_message = "The name for the subnet must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "maximum_network_security" {
  type        = bool
  description = "Separate private endpoints for backend and frontend?"
  default     = false
}

variable "virtual_network_id" {
  type        = string
  description = "The ID of a Virtual Network where this Databricks Cluster should be created."
}

variable "public_subnet_network_security_group_association_id" {
  type        = string
  description = "The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the public_subnet_name field."
}

variable "private_subnet_network_security_group_association_id" {
  type        = string
  description = "The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the private_subnet_name field."
}

variable "enable_ip_access_list" {
  type        = bool
  description = "Enable IP access lists."
  default     = false
}

variable "allow_ip_list" {
  type        = list(string)
  description = "Specifies the list of IPs allowed to the workspace."
  validation {
    condition     = length(var.allow_ip_list) == 0 || alltrue([for v in var.allow_ip_list : can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))(\\/([0-9]|[12][0-9]|3[0-2]))?$", v))])
    error_message = "Invalid IP or IP range in CIDR format found in the list."
  }
  default = []
}

variable "block_ip_list" {
  type        = list(string)
  description = "Specifies the list of IPs blocked to the workspace."
  validation {
    condition     = length(var.block_ip_list) == 0 || alltrue([for v in var.block_ip_list : can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))(\\/([0-9]|[12][0-9]|3[0-2]))?$", v))])
    error_message = "Invalid IP or IP range in CIDR format found in the list."
  }
  default = []
}