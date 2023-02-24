resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "firewall_virtual_network_subnet_ids" {
  type        = list(string)
  description = "A list of virtual network subnet ids to to secure the storage account."
  default     = []
}

variable "firewall_default_action" {
  type        = string
  description = "Specifies the default action of allow or deny when no other rules match."
  default     = "Deny"
}

variable "firewall_ip_rules" {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format."
  default     = []
}

variable "firewall_bypass" {
  type        = list(string)
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices."
  default     = ["AzureServices"]
}