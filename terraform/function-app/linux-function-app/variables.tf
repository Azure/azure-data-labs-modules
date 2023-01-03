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

variable "storage_account_name" {
  type        = string
  description = "The backend storage account name which will be used by this Function App"
}

variable "storage_account_access_key" {
  type        = string
  description = "The access key which will be used to access the backend storage account for the Function App"
}

variable "service_plan_id" {
  type        = string
  description = "The ID of the App Service Plan within which to create this Function App"
}