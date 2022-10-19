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

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
}

variable "adls_id" {
  type        = string
  description = "The ID of the adls associated with the syn workspace"
}

variable "storage_account_id" {
  type        = string
  description = "The ID of the storage account associated with the syn workspace"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account associated with the syn workspace"
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the key vault associated with the syn workspace"
}

variable "key_vault_name" {
  type        = string
  description = "The name of the key vault associated with the syn workspace"
}

variable "synadmin_username" {
  type        = string
  description = "The Login Name of the SQL administrator"
}

variable "synadmin_password" {
  type        = string
  description = "The Password associated with the sql_administrator_login for the SQL administrator"
}

variable "aad_login" {
  description = "AAD login"
  type = object({
    name      = string
    object_id = string
    tenant_id = string
  })
  default = {
    name      = "AzureAD Admin"
    object_id = "00000000-0000-0000-0000-000000000000"
    tenant_id = "00000000-0000-0000-0000-000000000000"
  }
}

variable "private_dns_zone_ids_sql" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
}

variable "private_dns_zone_ids_dev" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
}