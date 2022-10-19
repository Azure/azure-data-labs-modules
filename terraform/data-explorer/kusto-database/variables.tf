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

variable "cluster_name" {
  type        = string
  description = "Specifies the name of the Kusto Cluster this database will be added to"
}

variable "hot_cache_period" {
  type        = string
  description = "The time the data that should be kept in cache for fast queries as ISO 8601 timespan"
  default     = "P7D"
}

variable "soft_delete_period" {
  type        = string
  description = "The time the data should be kept before it stops being accessible to queries as ISO 8601 timespan"
  default     = "P31D"
}