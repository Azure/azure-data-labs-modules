variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "remote_virtual_network_id" {
  type        = string
  description = "The full Azure resource ID of the remote virtual network"
}

variable "allow_virtual_network_access" {
  type        = bool
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network"
  default     = true
}

variable "allow_forwarded_traffic" {
  type        = bool
  description = " Controls if forwarded traffic from VMs in the remote virtual network is allowed"
  default     = false
}

variable "allow_gateway_transit" {
  type        = bool
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network"
  default     = false
}

variable "use_remote_gateways" {
  type        = bool
  description = "Controls if remote gateways can be used on the local virtual network"
  default     = false
}