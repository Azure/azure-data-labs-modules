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
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
  default     = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
  default     = []
}

variable "input_schema" {
  type        = string
  description = "Specifies the schema in which incoming events will be published to this domain"
  default     = "EventGridSchema"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
  default     = false
}

variable "local_auth_enabled" {
  type        = bool
  description = "Whether local authentication methods is enabled for the EventGrid Domain"
  default     = true
}

variable "auto_create_topic_with_first_subscription" {
  type        = bool
  description = "Whether to create the domain topic when the first event subscription at the scope of the domain topic is created"
  default     = true
}

variable "auto_delete_topic_with_last_subscription" {
  type        = bool
  description = "Whether to delete the domain topic when the last event subscription at the scope of the domain topic is deleted"
  default     = true
}