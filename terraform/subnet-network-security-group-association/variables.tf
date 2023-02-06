variable "subnet_id" {
  type        = string
  description = "The ID of the Network Security Group which should be associated with the Subnet."
}

variable "network_security_group_id" {
  type        = string
  description = "The ID of the Subnet."
}