variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network to which to attach the subnet"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the Resource Group"
}

variable "name" {
  type        = string
  description = "Name of the subnet"
}

variable "address_prefixes" {
  type        = list(string)
  description = "value"
}

variable "enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "value"
  default     = false
}

variable "enforce_private_link_service_network_policies" {
  type        = bool
  description = "value"
  default     = false
}

variable "service_endpoints" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "service_endpoint_policy_ids" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "subnet_delegation" {
  description = "Subnet delegation block"
  type        = map(list(any))
  default     = {}
}