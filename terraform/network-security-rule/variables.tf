variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "name" {
  type        = string
  description = "The name of the security rule"
}

variable "priority" {
  type        = number
  description = "Specifies the priority of the rule"
}

variable "direction" {
  type        = string
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic"
}

variable "access" {
  type        = string
  description = "Specifies whether network traffic is allowed or denied"
}

variable "protocol" {
  type        = string
  description = "Network protocol this rule applies to"
}

variable "source_port_range" {
  type        = string
  description = "List of source ports or port ranges"
}

variable "destination_port_range" {
  type        = string
  description = "List of destination ports or port ranges"
  default     = "Destination Port or Range"
}

variable "source_address_prefix" {
  type        = string
  description = "CIDR or destination IP range or * to match any IP"
}

variable "destination_address_prefix" {
  type        = string
  description = "List of destination address prefixes."
}

variable "network_security_group_name" {
  type        = string
  description = "The name of the Network Security Group that we want to attach the rule to"
}