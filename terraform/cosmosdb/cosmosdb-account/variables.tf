variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "offer_type" {
  type        = string
  description = "Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard"
  default     = "Standard"
}

variable "network_acl_bypass_for_azure_services" {
  type        = bool
  description = "If azure services can bypass ACLs"
  default     = false
}

variable "enable_automatic_failover" {
  type        = bool
  description = "Enable automatic fail over for this Cosmos DB account"
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this CosmosDB account"
  default     = false
}

variable "kind" {
  type        = string
  description = "Specifies the Kind of CosmosDB to create"
  default     = "GlobalDocumentDB"
}

variable "enable_capability" {
  type        = string
  description = "Configures the capabilities to enable for the Cosmos DB account"
  default     = ""
}

# variable "private_dns_zone_ids_table" {
#   type        = list(string)
#   description = "Specifies the list of Private DNS Zones to include"
# }

# variable "private_dns_zone_ids_cassandra" {
#   type        = list(string)
#   description = "Specifies the list of Private DNS Zones to include"
# }

# variable "private_dns_zone_ids_mongo" {
#   type        = list(string)
#   description = "Specifies the list of Private DNS Zones to include"
# }

# variable "private_dns_zone_ids_gremlin" {
#   type        = list(string)
#   description = "Specifies the list of Private DNS Zones to include"
# }