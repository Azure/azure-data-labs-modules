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

variable "storage_account_name" {
  type        = string
  description = "(Optional) The backend storage account name which will be used by this Function App."
}

variable "storage_account_access_key" {
  type        = string
  description = " (Optional) The access key which will be used to access the backend storage account for the Function App. Conflicts with storage_uses_managed_identity."
}

variable "service_plan_id" {
  type        = string
  description = " (Required) The ID of the App Service Plan within which to create this Function App."
}

variable "enabled" {
  type        = bool
  description = "(Optional) Is the Function App enabled? Defaults to true."
  default     = true
}

variable "https_only" {
  type        = bool
  description = "(Optional) Can the Function App only be accessed via HTTPS? Defaults to false."
  default     = false
}

variable "client_certificate_enabled" {
  type        = bool
  description = "(Optional) Should the function app use Client Certificates."
  default     = false
}

variable "virtual_network_subnet_id" {
  type        = string
  description = "(Optional) The subnet id which will be used by this Function App for regional virtual network integration."
  default     = null
}