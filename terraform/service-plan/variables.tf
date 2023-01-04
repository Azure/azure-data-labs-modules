variable "basename" {
  type        = string
  description = "(Required) Basename of the module."
}

variable "rg_name" {
  type        = string
  description = "(Required) Resource group name."
}

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the resource should exist."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the deployed resource."
  default     = {}
}

variable "os_type" {
  type        = string
  description = "(Required) The O/S type for the App Services to be hosted in this plan. Possible values include `Windows`, `Linux`, and `WindowsContainer`."
  validation {
    condition     = can(regex("^(Windows|Linux|WindowsContainer)$", var.os_type))
    error_message = "Possible values include `Windows`, `Linux`, and `WindowsContainer`."
  }
  default = "Linux"
}

variable "sku_name" {
  type        = string
  description = "(Required) The SKU for the plan."
  default     = "Y1"
}

variable "app_service_environment_id" {
  type        = string
  description = "(Optional) The ID of the App Service Environment to create this Service Plan in."
  default     = null
}

variable "maximum_elastic_worker_count" {
  type        = number
  description = "(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU."
  default     = null
}

variable "worker_count" {
  type        = number
  description = "(Optional) The number of Workers (instances) to be allocated."
  default     = null
}

variable "per_site_scaling_enabled" {
  type        = bool
  description = "(Optional) Should Per Site Scaling be enabled. Defaults to `false`."
  default     = false
}

variable "zone_balancing_enabled" {
  type        = bool
  description = "(Optional) Should the Service Plan balance across Availability Zones in the region. Defaults to `false`."
  default     = false
}