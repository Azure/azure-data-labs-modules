resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "jumphost_username" {
  type        = string
  description = "VM username."
  default     = "azureuser"
}

variable "jumphost_password" {
  type        = string
  description = "VM password."
  default     = "ThisIsNotVerySecure!"
  sensitive   = true
}