variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{0,45}$", var.basename))
    error_message = "The name must be between 0 and 45 characters, can contain only letters, numbers and hyphens."
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

variable "input_schema" {
  type        = string
  description = "Specifies the schema in which incoming events will be published to this domain."
  validation {
    condition     = contains(["cloudeventschemav1_0", "customeventschema", "eventgridschema"], lower(var.input_schema))
    error_message = "Valid values for input_schema are \"CloudEventSchemaV1_0\", \"CustomEventSchema\", \"EventGridSchema\"."
  }
  default = "EventGridSchema"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this resource."
  default     = false
}

variable "local_auth_enabled" {
  type        = bool
  description = "Whether local authentication methods is enabled for the EventGrid Domain."
  default     = true
}

variable "auto_create_topic_with_first_subscription" {
  type        = bool
  description = "Whether to create the domain topic when the first event subscription at the scope of the domain topic is created."
  default     = true
}

variable "auto_delete_topic_with_last_subscription" {
  type        = bool
  description = "Whether to delete the domain topic when the last event subscription at the scope of the domain topic is deleted."
  default     = true
}