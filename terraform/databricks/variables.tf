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
  default = ""
}

variable "public_network_enabled" {
  type        = bool
  description = "Should the Purview Account be visible to the public network?"
  default     = false
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
  default = [ ]
}

variable "sku" {
  type        = string
  description = "The sku to use for the Databricks Workspace"
  default     = "premium"
}

variable "public_subnet_name" {
  type        = string
  description = "The name of the Public Subnet within the Virtual Network"
}

variable "private_subnet_name" {
  type        = string
  description = "The name of the Private Subnet within the Virtual Network"
}

variable "virtual_network_id" {
  type        = string
  description = "The ID of a Virtual Network where this Databricks Cluster should be created"
}

variable "public_subnet_network_security_group_association_id" {
  type        = string
  description = "The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the public_subnet_name field"
}

variable "private_subnet_network_security_group_association_id" {
  type        = string
  description = "The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the private_subnet_name field"
}