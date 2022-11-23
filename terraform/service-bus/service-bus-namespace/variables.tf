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

variable "listen" {
  type        = bool
  description = " Grants listen access to this this Authorization Rule"
  default     = true
}

variable "send" {
  type        = bool
  description = "Grants send access to this this Authorization Rule"
  default     = true
}

variable "manage" {
  type        = bool
  description = "Grants manage access to this this Authorization Rule"
  default     = false
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
  default     = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
  default     = []
}

variable "sku" {
  type        = string
  description = "Defines which tier to use"
  default     = "Premium"
}

variable "capacity" {
  type        = number
  description = "Specifies the capacity"
  default     = 1
}