variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-z]{1,55}$", var.basename)) && can(regex("[0-9a-z]+$", var.basename))
    error_message = "The name must be between 1 and 55 characters, must only contain lowercase letters, digits or dashes, cannot use dash as the last character, cannot contain consecutive dashes."
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
  description = "A mapping of tags which should be assigned to the deployed resource."
  default     = {}
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

variable "sku" {
  type        = string
  description = "The SKU which should be used for this Search Service."
  validation {
    condition     = contains(["basic", "free", "standard", "standard2", "standard3", "storage_optimized_l1", "storage_optimized_l2"], lower(var.sku))
    error_message = "Valid values for sku_name are \"basic\", \"free\", \"standard\", \"standard2\", \"standard3\", \"storage_optimized_l1\", or \"storage_optimized_l2\"."
  }
  default = "standard"
}

variable "partition_count" {
  type        = number
  description = "The number of partitions which should be created."
  validation {
    condition     = var.partition_count == 1 || var.partition_count == 2 || var.partition_count == 3 || var.partition_count == 4 || var.partition_count == 6 || var.partition_count == 12
    error_message = "Valid values for partition_count are 1, 2, 3, 4, 6, or 12."
  }
  default = 1
}

variable "replica_count" {
  type        = number
  description = "The number of replica's which should be created."
  validation {
    condition     = var.replica_count == 1 || var.replica_count == 2 || var.replica_count == 3 || var.replica_count == 4 || var.replica_count == 6 || var.replica_count == 12
    error_message = "Valid values for replica_count are 1, 2, 3, 4, 6, or 12."
  }
  default = 1
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this resource."
  default     = false
}