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

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module"
}

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
  default     = ""
}

variable "sku" {
  type        = string
  description = "Defines which tier to use"
  default     = "Standard"
}

variable "maximum_throughput_units" {
  type        = number
  description = "Specifies the maximum number of throughput units when Auto Inflate is Enabled"
  default     = 20
}

variable "zone_redundant" {
  type        = bool
  description = "Specifies if the EventHub Namespace should be Zone Redundant (created across Availability Zones)"
  default     = true
}

variable "auto_inflate_enabled" {
  type        = bool
  description = "Is Auto Inflate enabled for the EventHub Namespace?"
  default     = true
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
  default     = []
}

variable "partition_count" {
  type        = number
  description = "Specifies the current number of shards on the Event Hub"
  default     = 2
}

variable "message_retention" {
  type        = number
  description = "Specifies the number of days to retain the events for this Event Hub"
  default     = 1
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

variable "public_network_access_enabled" {
  type        = bool
  description = "Is public network access enabled for the EventHub Namespace? "
  default     = false
}