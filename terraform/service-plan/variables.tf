variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{0,37}$", var.basename)) && can(regex("[-\\w\\(\\)]+$", var.basename))
    error_message = "Names must be between 0 and 37 characters and can only include alphanumeric characters or hyphens."
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
  description = "The Azure Region where the resource should exist."
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

variable "os_type" {
  type        = string
  description = "The O/S type for the App Services to be hosted in this plan. Possible values include `Windows`, `Linux`, and `WindowsContainer`."
  validation {
    condition     = contains(["windows", "linux", "windowscontainer"], lower(var.os_type))
    error_message = "Valid values for sku are \"Windows\", \"Linux\", or \"WindowsContainer\"."
  }
  default = "Linux"
}

variable "sku_name" {
  type        = string
  description = "The SKU for the plan."
  validation {
    condition     = contains(["b1", "b2", "b3", "d1", "f1", "i1", "i2", "i3", "i1v2", "i2v2", "i3v2", "p1v2", "p2v2", "p3v2", "p1v3", "p2v3", "p3v3", "s1", "s2", "s3", "shared", "ep1", "ep2", "ep3", "ws1", "ws2", "ws3", "y1"], lower(var.sku_name))
    error_message = "Valid values for sku_name are \"B1\", \"B2\", \"B3\", \"D1\", \"F1\", \"I1\", \"I2\", \"I3\", \"I1v2\", \"I2v2\", \"I3v2\", \"P1v2\", \"P2v2\", \"P3v2\", \"P1v3\", \"P2v3\", \"P3v3\", \"S1\", \"S2\", \"S3\", \"SHARED\", \"EP1\", \"EP2\", \"EP3\", \"WS1\", \"WS2\", \"WS3\", or \"Y1\"."
  }
  default = "Y1"
}

variable "app_service_environment_id" {
  type        = string
  description = "The ID of the App Service Environment to create this Service Plan in."
  default     = null
}

variable "maximum_elastic_worker_count" {
  type        = number
  description = "The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU."
  default     = null
}

variable "worker_count" {
  type        = number
  description = "The number of Workers (instances) to be allocated."
  default     = null
}

variable "per_site_scaling_enabled" {
  type        = bool
  description = "Should Per Site Scaling be enabled. Defaults to `false`."
  default     = false
}

variable "zone_balancing_enabled" {
  type        = bool
  description = "Should the Service Plan balance across Availability Zones in the region. Defaults to `false`."
  default     = false
}