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

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for the user access Private Endpoints"
}

variable "public_network_enabled" {
  type        = bool
  description = "Should the Purview Account be visible to the public network?"
  default     = false
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
}
