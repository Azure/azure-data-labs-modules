resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "rg_name" {
  type    = string
  default = "rg-azurelabs-modules-01-we"
}

variable "kind" {
  type        = string
  description = "Specifies the Kind of CosmosDB to create"
  default     = "GlobalDocumentDB"
}

variable "enable_capability" {
  type        = string
  description = "Configures the capabilities to enable for the Cosmos DB account"
  default     = "DisableRateLimitingResponses"
}