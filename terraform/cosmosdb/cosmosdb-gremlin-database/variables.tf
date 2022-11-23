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

variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint"
  default = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
  default = [ ]
}

variable "cosmosdb_account_name" {
  type        = string
  description = "The Cosmos DB account name"
}

variable "cosmosdb_account_id" {
  type        = string
  description = "The Cosmos DB account id"
}

variable "throughput" {
  type        = number
  description = "The throughput of Cassandra KeySpace (RU/s)"
  default     = 400
}