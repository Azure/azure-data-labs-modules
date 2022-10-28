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
  default = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
}

variable "kind" {
  type        = string
  description = "Specifies the type of Cognitive Service Account that should be created"
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Cognitive Service Account"
  default     = "S0"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for the Cognitive Account"
  default     = false
}

variable "outbound_network_access_restrited" {
  type        = bool
  description = "Whether outbound network access is restricted for the Cognitive Account"
  default     = true
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
}