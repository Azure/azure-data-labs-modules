variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[0-9a-zA-Z]{3,48}$", var.basename))
    error_message = "The name must be between 3 and 48 characters, must only contain alphanumeric characters."
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
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "sku" {
  type        = string
  description = "The SKU name of the container registry."
  validation {
    condition     = contains(["basic", "standard", "premium"], lower(var.sku))
    error_message = "Valid values for sku_name are \"Basic\", \"Standard\", or \"Premium\"."
  }
  default = "Premium"
}

variable "admin_enabled" {
  type        = bool
  description = "Specifies whether the admin user is enabled."
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for the container registry."
  default     = false
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
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