variable "rg_name" {
  type    = string
  default = "rg-adl-modules-test-01"
}

variable "rg_name_dns" {
  type    = string
  default = "rg-adl-modules-test-01-global-dns"
}

resource "random_string" "postfix" {
  length  = 6
  special = false
  upper   = false
}

variable "dns_zones" {
  type        = set(string)
  description = "List of Private DNS Zones utilized by Azure Private Link resources"
  default = [
    "privatelink.queue.core.windows.net"
  ]
}