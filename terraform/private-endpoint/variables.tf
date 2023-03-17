variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{1,57}", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename)) && !can(regex("[-]{2,}", var.basename))
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

variable "subnet_id" {
  type        = string
  description = "(Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created"
}

variable "private_connection_resource_id" {
  type        = string
  description = " (Required) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private_connection_resource_id or private_connection_resource_alias must be specified. Changing this forces a new resource to be created. For a web app or function app slot, the parent web app should be used in this field instead of a reference to the slot itself."
}

variable "subresource_names" {
  type        = list(string)
  description = "(Optional) A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Changing this forces a new resource to be created."
  default     = [""]
}

variable "is_manual_connection" {
  type        = bool
  description = "(Optional) Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created"
  default     = false
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "(Required) Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
}