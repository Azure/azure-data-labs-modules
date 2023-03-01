resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "firewall_virtual_network_subnet_ids" {
  type        = list(string)
  description = "A list of virtual network subnet ids to secure the storage account."
  default     = []
}
