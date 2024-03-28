variable "basename" {
  type        = string
  description = "Basename of the module."
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

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this resource."
  default     = false
}

variable "listen" {
  type        = bool
  description = " Grants listen access to this this Authorization Rule."
  default     = true
}

variable "send" {
  type        = bool
  description = "Grants send access to this this Authorization Rule."
  default     = true
}

variable "manage" {
  type        = bool
  description = "Grants manage access to this this Authorization Rule."
  default     = false
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

variable "sku" {
  type        = string
  description = "Defines which tier to use."
  default     = "Premium"
}

variable "capacity" {
  type        = number
  description = "Specifies the capacity."
  default     = 1
}

variable "premium_messaging_partitions" {
  type        = number
  description = "Specifies the number messaging partitions."
  default     = 1
}