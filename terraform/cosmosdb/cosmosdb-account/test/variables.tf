resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "West US"
}

variable "kind" {
  type        = string
  description = "Specifies the Kind of CosmosDB to create."
  default     = "GlobalDocumentDB"
}

variable "enable_capabilities" {
  type        = list(string)
  description = "Configures the capabilities to enable for the Cosmos DB account."
  default     = ["DisableRateLimitingResponses", "EnableAggregationPipeline"]
}