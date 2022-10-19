variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource"
}

# variable "vnet_id" {
#   type        = string
#   description = "The ID of the vnet that should be linked to the DNS zone"
# }

variable "dns_zones" {
  type        = set(string)
  description = "List of Private DNS Zones utilized by Azure Private Link resources"
}  