variable "basename" {
  type        = string
  description = "Basename of the module."
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

variable "is_private_endpoint" {
  type        = bool
  description = "Whether private endpoints are enabled to access the resource."
  default     = true
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
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

variable "db_version" {
  type        = string
  description = "The version for the new server."
  validation {
    condition     = contains(["2.0", "12.0"], lower(var.db_version))
    error_message = "Valid values for db_version are \"2.0\", or \"12.0\"."
  }
}

variable "administrator_login" {
  type        = string
  description = "The administrator login name for the new server."
  validation {
    condition     = can(regex("^[\\s\\S]{8,128}$", var.administrator_login)) && can(regex("^[a-zA-Z]+", var.administrator_login))
    error_message = "Valid values for administrator_login must be betwen 8 and 128 characters in length and must start with a letter."
  }
}

variable "administrator_login_password" {
  type        = string
  description = "The password associated with the administrator_login."
  validation {
    condition     = can(regex("^[\\s\\S]{8,128}$", var.administrator_login_password))
    error_message = "Valid values for administrator_login_password must be at least 8 characters in length."
  }
  sensitive = true
}

variable "minimum_tls_version" {
  type        = string
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server."
  validation {
    condition     = contains(["1.0", "1.1", "1.2", "disabled"], lower(var.minimum_tls_version))
    error_message = "Valid values for sku are \"1.0\", \"1.1\", \"1.2\", or \"Disabled\"."
  }
  default = "1.2"
}

variable "azuread_administrator" {
  type = map(
    object(
      {
        login_username              = optional(string)
        object_id                   = optional(string)
        tenant_id                   = optional(string)
        azuread_authentication_only = optional(bool)
      }
    )
  )
  description = <<EOT
    "
        login_username - The login username of the Azure AD Administrator of this SQL Server.
        object_id - The object id of the Azure AD Administrator of this SQL Server.
        tenant_id - The tenant id of the Azure AD Administrator of this SQL Server.
        azuread_authentication_only - Specifies whether only AD Users and administrators (like azuread_administrator.0.login_username) can be used to login, or also local database users (like administrator_login). When true, the administrator_login and administrator_login_password properties can be omitted.
    "
  EOT
  validation {
    condition     = length(var.azuread_administrator) == 0 || length(var.azuread_administrator) == 1
    error_message = "Invalid values provided for azuread_administrator."
  }
  default = {}
}
