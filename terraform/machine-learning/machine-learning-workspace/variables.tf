variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{0,29}$", var.basename))
    error_message = "The name must be between 0 and 293 characters, can contain only letters, numbers, hyphens, and underscores."
  }
}

variable "rg_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.rg_name)) && can(regex("[-\\w\\(\\)]+$", var.rg_name))
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

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public access when this Machine Learning Workspace is behind a VNet."
  default     = false
}

variable "storage_account_id" {
  type        = string
  description = "The ID of the Storage Account linked to AML workspace."
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault linked to AML workspace."
}

variable "application_insights_id" {
  type        = string
  description = "The ID of the Application Insights linked to AML workspace."
}

variable "container_registry_id" {
  type        = string
  description = "The ID of the Container Registry linked to AML workspace."
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "image_build_compute_name" {
  type        = string
  description = "The compute name for image build of the Machine Learning Workspace."
  default     = "image-builder"
}