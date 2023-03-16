variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network to which to attach the subnet."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.vnet_name)) && can(regex("^[0-9a-zA-Z]+", var.vnet_name)) && can(regex("[\\w]+$", var.vnet_name))
    error_message = "The name for the virtual network must be between 1 and 80 characters and must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the Resource Group."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "name" {
  type        = string
  description = "Name of the subnet."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.name)) && can(regex("^[0-9a-zA-Z]+", var.name)) && can(regex("[\\w]+$", var.name))
    error_message = "The name for the subnet must be between 1 and 80 characters and must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the subnet."
}

variable "private_endpoint_network_policies_enabled" {
  type        = bool
  description = "Enable or Disable network policies for the private endpoint on the subnet."
  default     = false
}

variable "private_link_service_network_policies_enabled" {
  type        = bool
  description = "Enable or Disable network policies for the private link service on the subnet."
  default     = false
}

variable "service_endpoints" {
  type        = list(string)
  description = "The list of Service endpoints to associate with the subnet."
  validation {
    condition     = alltrue([for v in var.service_endpoints : contains(["microsoft.azureactivedirectory", "microsoft.azurecosmosdb", "microsoft.containerregistry", "microsoft.eventhub", "microsoft.keyvault", "microsoft.servicebus", "microsoft.sql", "microsoft.storage", "microsoft.web"], lower(v))])
    error_message = "Valid values for service_endpoints are \"Microsoft.AzureActiveDirectory\", \"Microsoft.AzureCosmosDB\", \"Microsoft.ContainerRegistry\", \"Microsoft.EventHub\", \"Microsoft.KeyVault\", \"Microsoft.ServiceBus\", \"Microsoft.Sql\", \"Microsoft.Storage\", or \"Microsoft.Web\"."
  }
  default = []
}

variable "service_endpoint_policy_ids" {
  type        = list(string)
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  default     = []
}

variable "subnet_delegation" {
  description = "Subnet delegation block."
  type        = map(list(any))
  default     = {}
}