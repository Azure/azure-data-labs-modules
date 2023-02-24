resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "dns_zones" {
  type        = set(string)
  description = "List of Private DNS Zones utilized by Azure Private Link resources."
  default = [
    "privatelink.queue.core.windows.net"
  ]
}