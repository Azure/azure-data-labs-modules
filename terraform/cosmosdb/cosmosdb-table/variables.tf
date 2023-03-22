variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-z]{1,37}$", var.basename)) && can(regex("[0-9a-z]+$", var.basename))
    error_message = "The name must be between 1 and 37 characters, can contain only lowercase letters, numbers and the '-' character, and must not end with the character '-'."
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

variable "cosmosdb_account_name" {
  type        = string
  description = "The Cosmos DB account name."
}

variable "cosmosdb_account_id" {
  type        = string
  description = "The Cosmos DB account id."
}

variable "throughput" {
  type        = number
  description = "The throughput of Table (RU/s)."
  validation {
    condition     = var.throughput >= 400 && var.throughput <= 1000000 && floor(var.throughput) == var.throughput
    error_message = "Valid values for throughput are integers in the range [400, 1000000]."
  }
  default = 400
}