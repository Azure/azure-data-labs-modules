variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-z]{1,37}$", var.basename)) && can(regex("[0-9a-z]+$", var.basename))
    error_message = "The name must be between 1 and 37 characters, can contain only lowercase letters, numbers and the '-' character, and must not end with the character '-'."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "location" {
  type        = string
  description = "Location of the resource group."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "offer_type" {
  type        = string
  description = "Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard."
  validation {
    condition     = contains(["standard"], lower(var.offer_type))
    error_message = "Valid values for offer_type are \"Standard\"."
  }
  default = "Standard"
}

variable "network_acl_bypass_for_azure_services" {
  type        = bool
  description = "If azure services can bypass ACLs."
  default     = false
}

variable "enable_automatic_failover" {
  type        = bool
  description = "Enable automatic fail over for this Cosmos DB account."
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this CosmosDB account."
  default     = false
}

variable "kind" {
  type        = string
  description = "Specifies the Kind of CosmosDB to create."
  validation {
    condition     = contains(["globaldocumentdb", "mongodb", "parse"], lower(var.kind))
    error_message = "Valid values for sku_name are \"GlobalDocumentDB\", \"MongoDB \", or \"Parse\"."
  }
  default = "GlobalDocumentDB"
}

variable "enable_capabilities" {
  type        = list(string)
  description = "Configures the capabilities to enable for the Cosmos DB account."
  validation {
    condition     = length(var.enable_capabilities) == 0 || alltrue([for v in var.enable_capabilities : contains(["allowselfserveupgradetomongo36", "disableratelimitingresponses", "enableaggregationpipeline", "enablecassandra", "enablegremlin", "enablemongo", "enablemongo16mbdocumentsupport", "enabletable", "enableserverless", "mongodbv3.4", "mongoenabledoclevelttl"], lower(v))])
    error_message = "Valid values for enable_capabilities are \"AllowSelfServeUpgradeToMongo36\", \"DisableRateLimitingResponses\", \"EnableAggregationPipeline\", \"EnableCassandra\", \"EnableGremlin\", \"EnableMongo\", \"EnableMongo16MBDocumentSupport\", \"EnableTable\", \"EnableServerless\", \"MongoDBv3.4\", \"mongoEnableDocLevelTTL\"."
  }
  default = []
}

# variable "private_dns_zone_ids_table" {
#   type        = list(string)
#   description = "Specifies the list of Private DNS Zones to include."
# }

# variable "private_dns_zone_ids_cassandra" {
#   type        = list(string)
#   description = "Specifies the list of Private DNS Zones to include."
# }

# variable "private_dns_zone_ids_mongo" {
#   type        = list(string)
#   description = "Specifies the list of Private DNS Zones to include."
# }

# variable "private_dns_zone_ids_gremlin" {
#   type        = list(string)
#   description = "Specifies the list of Private DNS Zones to include."
# }