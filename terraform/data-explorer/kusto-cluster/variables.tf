variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[0-9a-z]{0,19}$", var.basename))
    error_message = "The name must be between 0 and 19 characters, and can contain lowercase alphanumeric characters."
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

variable "is_private_endpoint" {
  type        = bool
  description = "Whether private endpoints are enabled to access the resource."
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "sku_name" {
  type        = string
  description = "The name of the SKU."
  validation {
    condition     = contains(["dev(no sla)_standard_d11_v2", "dev(no sla)_standard_e2a_v4", "standard_d11_v2", "standard_d12_v2", "standard_d13_v2", "standard_d14_v2", "standard_d16d_v5", "standard_d32d_v4", "standard_d32d_v5", "standard_ds13_v2+1tb_ps", "standard_ds13_v2+2tb_ps", "standard_ds14_v2+3tb_ps", "standard_ds14_v2+4tb_ps", "standard_e16a_v4", "standard_e16ads_v5", "standard_e16as_v4+3tb_ps", "standard_e16as_v4+4tb_ps", "standard_e16as_v5+3tb_ps", "standard_e16as_v5+4tb_ps", "standard_e16s_v4+3tb_ps", "standard_e16s_v4+4tb_ps", "standard_e16s_v5+3tb_ps", "standard_e16s_v5+4tb_ps", "standard_e2a_v4", "standard_e2ads_v5,standard_e4a_v4", "standard_e4ads_v5", "standard_e64i_v3", "standard_e80ids_v4", "standard_e8a_v4", "standard_e8ads_v5", "standard_e8as_v4+1tb_ps", "standard_e8as_v4+2tb_ps", "standard_e8as_v5+1tb_ps", "standard_e8as_v5+2tb_ps", "standard_e8s_v4+1tb_ps", "standard_e8s_v4+2tb_ps", "standard_e8s_v5+1tb_ps", "standard_e8s_v5+2tb_ps", "standard_l16s", "standard_l16s_v2", "standard_l4s", "standard_l8s", "standard_l8s_v2", "standard_l8s_v3", "standard_l16s_v3", "standard_l8as_v3", "standard_l16as_v3", "standard_ec8as_v5+1tb_ps", "standard_ec8as_v5+2tb_ps", "standard_ec16as_v5+3tb_ps", "standard_ec16as_v5+4tb_ps", "standard_ec8ads_v5", "standard_ec16ads_v5", "standard_e2d_v4", "standard_e4d_v4", "standard_e8d_v4", "standard_e16d_v4", "standard_e2d_v5", "standard_e4d_v5", "standard_e8d_v5", "standard_e16d_v5"], lower(var.sku_name))
    error_message = "Valid values for sku_name are \"Dev(No SLA)_Standard_D11_v2\", \"Dev(No SLA)_Standard_E2a_v4\", \"Standard_D11_v2\", \"Standard_D12_v2\", \"Standard_D13_v2\", \"Standard_D14_v2\", \"Standard_D16d_v5\", \"Standard_D32d_v4\", \"Standard_D32d_v5\", \"Standard_DS13_v2+1TB_PS\", \"Standard_DS13_v2+2TB_PS\", \"Standard_DS14_v2+3TB_PS\", \"Standard_DS14_v2+4TB_PS\", \"Standard_E16a_v4\", \"Standard_E16ads_v5\", \"Standard_E16as_v4+3TB_PS\", \"Standard_E16as_v4+4TB_PS\", \"Standard_E16as_v5+3TB_PS\", \"Standard_E16as_v5+4TB_PS\", \"Standard_E16s_v4+3TB_PS\", \"Standard_E16s_v4+4TB_PS\", \"Standard_E16s_v5+3TB_PS\", \"Standard_E16s_v5+4TB_PS\", \"Standard_E2a_v4\", \"Standard_E2ads_v5,Standard_E4a_v4\", \"Standard_E4ads_v5\", \"Standard_E64i_v3\", \"Standard_E80ids_v4\", \"Standard_E8a_v4\", \"Standard_E8ads_v5\", \"Standard_E8as_v4+1TB_PS\", \"Standard_E8as_v4+2TB_PS\", \"Standard_E8as_v5+1TB_PS\", \"Standard_E8as_v5+2TB_PS\", \"Standard_E8s_v4+1TB_PS\", \"Standard_E8s_v4+2TB_PS\", \"Standard_E8s_v5+1TB_PS\", \"Standard_E8s_v5+2TB_PS\", \"Standard_L16s\", \"Standard_L16s_v2\", \"Standard_L4s\", \"Standard_L8s\", \"Standard_L8s_v2\", \"Standard_L8s_v3\", \"Standard_L16s_v3\", \"Standard_L8as_v3\", \"Standard_L16as_v3\", \"Standard_EC8as_v5+1TB_PS\", \"Standard_EC8as_v5+2TB_PS\", \"Standard_EC16as_v5+3TB_PS\", \"Standard_EC16as_v5+4TB_PS\", \"Standard_EC8ads_v5\", \"Standard_EC16ads_v5\", \"Standard_E2d_v4\", \"Standard_E4d_v4\", \"Standard_E8d_v4\", \"Standard_E16d_v4\", \"Standard_E2d_v5\", \"Standard_E4d_v5\", \"Standard_E8d_v5\", or \"Standard_E16d_v5\"."
  }
  default = "Standard_D13_v2"
}

variable "sku_capacity" {
  type        = number
  description = "Specifies the node count for the cluster."
  default     = 2
}

variable "auto_stop_enabled" {
  type        = bool
  description = "Specifies if the cluster could be automatically stopped (due to lack of data or no activity for many days)."
  default     = true
}

variable "disk_encryption_enabled" {
  type        = bool
  description = "Specifies if the cluster's disks are encrypted."
  default     = false
}

variable "streaming_ingestion_enabled" {
  type        = bool
  description = "Specifies if the streaming ingest is enabled."
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Is the public network access enabled?"
  default     = false
}

variable "purge_enabled" {
  type        = bool
  description = "Specifies if the purge operations are enabled."
  default     = false
}

variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Kusto Cluster should be located."
  default     = []
}

variable "engine" {
  type        = string
  description = "The engine type that should be used."
  validation {
    condition     = contains(["v2", "v3"], lower(var.engine))
    error_message = "Valid values for sku_name are \"V2\", or \"V3\"."
  }
  default = "V3"
}