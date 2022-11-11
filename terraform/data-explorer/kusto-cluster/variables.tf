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
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
}

variable "sku_name" {
  type        = string
  description = "The name of the SKU"
  default     = "Standard_D13_v2"
}

variable "sku_capacity" {
  type        = number
  description = "Specifies the node count for the cluster"
  default     = 2
}

variable "auto_stop_enabled" {
  type        = bool
  description = "Specifies if the cluster could be automatically stopped (due to lack of data or no activity for many days)"
  default     = true
}

variable "disk_encryption_enabled" {
  type        = bool
  description = "Specifies if the cluster's disks are encrypted"
  default     = false
}

variable "streaming_ingestion_enabled" {
  type        = bool
  description = "Specifies if the streaming ingest is enabled"
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Is the public network access enabled?"
  default     = false
}

variable "purge_enabled" {
  type        = bool
  description = "Specifies if the purge operations are enabled"
  default     = false
}

variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Kusto Cluster should be located"
  default     = []
}

variable "engine" {
  type        = string
  description = "The engine type that should be used"
  default     = "V2"

}