variable "basename" {
  type        = string
  description = "Basename of the module."
}

variable "rg_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{0,89}[^\\.]{1}$", var.rg_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)"
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

variable "server_name" {
  type        = string
  description = "The name of the SQL Server on which to create the database."
}

variable "collation" {
  type        = string
  description = "The name of the collation."
}

variable "edition" {
  type        = string
  description = "The edition of the database to be created."
}

variable "requested_service_objective_name" {
  type        = string
  description = "A GUID/UUID corresponding to a configured Service Level Objective for the Azure SQL database which can be used to configure a performance level."
}