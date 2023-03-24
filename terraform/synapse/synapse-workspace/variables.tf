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
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "adls_id" {
  type        = string
  description = "The ID of the adls associated with the syn workspace."
}

variable "storage_account_id" {
  type        = string
  description = "The ID of the storage account associated with the syn workspace."
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account associated with the syn workspace."
  validation {
    condition     = can(regex("^[0-9a-z]{1,24}$", var.storage_account_name))
    error_message = "The name must be betwen 1 and 24 characters, can only contain lowercase letters and  numbers."
  }
}

variable "synadmin_username" {
  type        = string
  description = "The Login Name of the SQL administrator."
}

variable "synadmin_password" {
  type        = string
  description = "The Password associated with the sql_administrator_login for the SQL administrator."
  sensitive   = true
}

variable "set_aad_login" {
  type    = bool
  default = false
}

variable "aad_login" {
  description = "AAD login."
  type = object({
    name      = string
    object_id = string
    tenant_id = string
  })
  default = {
    name      = "AzureAD Admin"
    object_id = "00000000-0000-0000-0000-000000000000"
    tenant_id = "00000000-0000-0000-0000-000000000000"
  }
}

variable "private_dns_zone_ids_sql" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "private_dns_zone_ids_dev" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "managed_virtual_network_enabled" {
  type        = bool
  description = "Is Virtual Network enabled for all computes in this workspace? Changing this forces a new resource to be created."
  default     = true
}