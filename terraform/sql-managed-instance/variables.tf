variable "basename" {
  type        = string
  description = "Basename of the module."
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
  description = "A mapping of tags which should be assigned to the deployed resource."
  default     = {}
}

variable "is_private_endpoint" {
  type        = bool
  description = "Whether private endpoints are enabled to access the resource."
  default     = true
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated."
}

variable "subnet_private_enpoint_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
}

variable "route_table_id" {
  type        = string
  description = " The route table for associated with the subnet."
}

variable "network_security_group_id" {
  type        = string
  description = " The NSG for associated with the subnet."
}

variable "license_type" {
  type        = string
  description = "What type of license the Managed Instance will use."
  validation {
    condition     = contains(["licenseincluded", "baseprice"], lower(var.license_type))
    error_message = "Possible values are \"LicenseIncluded\", or \"BasePrice\"."
  }
  default = "BasePrice"
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for the SQL Managed Instance."
  validation {
    condition     = contains(["gp_gen4", "gp_gen5", "gp_gen8im", "gp_gen8ih", "bc_gen4", "bc_gen5", "bc_gen8im", "bc_gen8ih"], lower(var.sku_name))
    error_message = "Valid values include \"GP_Gen4\", \"GP_Gen5\", \"GP_Gen8IM\", \"GP_Gen8IH\", \"BC_Gen4\", \"BC_Gen5\", \"BC_Gen8IM\" or \"BC_Gen8IH\"."
  }
  default = "GP_Gen5"
}

variable "storage_size_in_gb" {
  type        = number
  description = "Maximum storage space for the SQL Managed instance."
  default     = 32
  validation {
    condition     = var.storage_size_in_gb >= 32 && var.storage_size_in_gb <= 8192 && var.storage_size_in_gb % 32 == 0
    error_message = "Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 8, 16, 24, 32, 40, 64, or 80 for Gen5 SKUs."
  }

}

variable "vcores" {
  type        = number
  description = "Number of cores that should be assigned to the SQL Managed Instance."
  validation {
    condition     = contains([4, 8, 16, 24, 32, 40, 64, 80], var.vcores)
    error_message = "Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 8, 16, 24, 32, 40, 64, or 80 for Gen5 SKUs."
  }
  default = 4
}

variable "administrator_login" {
  type        = string
  description = "The administrator login name for the new server."
}

variable "administrator_login_password" {
  type        = string
  description = "The password associated with the administrator_login."
  validation {
    condition     = can(regex("^[\\s\\S]{16,128}$", var.administrator_login_password))
    error_message = "Valid values for administrator_login_password must be at least 16 characters in length."
  }
  sensitive = true
}

variable "maintenance_configuration_name" {
  type        = string
  description = "The name of the Public Maintenance Configuration window to apply to the SQL Managed Instance."
  validation {
    condition     = contains(["SQL_Default", "SQL_EastUS_MI_1", "SQL_EastUS2_MI_1", "SQL_WestUS2_MI_1", "SQL_SoutheastAsia_MI_1", "SQL_AustraliaEast_MI_1", "SQL_NorthEurope_MI_1", "SQL_SouthCentralUS_MI_1", "SQL_UKSouth_MI_1", "SQL_WestEurope_MI_1", "SQL_EastUS_MI_2", "SQL_EastUS2_MI_2", "SQL_WestUS2_MI_2", "SQL_SoutheastAsia_MI_2", "SQL_NorthEurope_MI_2", "SQL_SouthCentralUS_MI_2", "SQL_UKSouth_MI_2", "SQL_WestEurope_MI_2", "SQL_AustraliaSoutheast_MI_1", "SQL_BrazilSouth_MI_1", "SQL_CanadaCentral_MI_1", "SQL_CanadaEast_MI_1", "SQL_CentralUS_MI_1", "SQL_EastAsia_MI_1", "SQL_FranceCentral_MI_1", "SQL_GermanyWestCentral_MI_1", "SQL_CentralIndia_MI_1", "SQL_JapanEast_MI_1", "SQL_JapanWest_MI_1", "SQL_NorthCentralUS_MI_1", "SQL_UKWest_MI_1", "SQL_WestUS_MI_1", "SQL_AustraliaSoutheast_MI_2", "SQL_BrazilSouth_MI_2", "SQL_CanadaCentral_MI_2", "SQL_CanadaEast_MI_2", "SQL_CentralUS_MI_2", "SQL_EastAsia_MI_2", "SQL_FranceCentral_MI_2", "SQL_GermanyWestCentral_MI_2", "SQL_CentralIndia_MI_2", "SQL_JapanEast_MI_2", "SQL_JapanWest_MI_2", "SQL_NorthCentralUS_MI_2", "SQL_UKWest_MI_2", "SQL_WestUS_MI_2", "SQL_KoreaCentral_MI_1", "SQL_KoreaCentral_MI_2", "SQL_WestCentralUS_MI_1", "SQL_WestCentralUS_MI_2", "SQL_UAENorth_MI_1", "SQL_SwitzerlandWest_MI_1", "SQL_SwitzerlandNorth_MI_1", "SQL_UAENorth_MI_2", "SQL_SwitzerlandWest_MI_2", "SQL_SwitzerlandNorth_MI_2", "SQL_FranceSouth_MI_1", "SQL_FranceSouth_MI_2", "SQL_SouthAfricaNorth_MI_1", "SQL_KoreaSouth_MI_1", "SQL_UAECentral_MI_1", "SQL_SouthAfricaNorth_MI_2", "SQL_KoreaSouth_MI_2", "SQL_UAECentral_MI_2", "SQL_SouthIndia_MI_1", "SQL_SouthIndia_MI_2", "SQL_AustraliaCentral_MI_1", "SQL_AustraliaCentral2_MI_1", "SQL_AustraliaCentral_MI_2", "SQL_AustraliaCentral2_MI_2", "SQL_WestIndia_MI_1", "SQL_WestIndia_MI_2", "SQL_SouthAfricaWest_MI_1", "SQL_SouthAfricaWest_MI_2", "SQL_GermanyNorth_MI_1", "SQL_GermanyNorth_MI_2", "SQL_NorwayEast_MI_1", "SQL_BrazilSoutheast_MI_1", "SQL_NorwayWest_MI_1", "SQL_WestUS3_MI_1", "SQL_NorwayEast_MI_2", "SQL_BrazilSoutheast_MI_2", "SQL_NorwayWest_MI_2", "SQL_WestUS3_MI_2"], var.maintenance_configuration_name)
    error_message = "Valid values include SQL_Default, SQL_EastUS_MI_1, SQL_EastUS2_MI_1, SQL_WestUS2_MI_1, SQL_SoutheastAsia_MI_1, SQL_AustraliaEast_MI_1, SQL_NorthEurope_MI_1, SQL_SouthCentralUS_MI_1, SQL_UKSouth_MI_1, SQL_WestEurope_MI_1, SQL_EastUS_MI_2, SQL_EastUS2_MI_2, SQL_WestUS2_MI_2, SQL_SoutheastAsia_MI_2, SQL_NorthEurope_MI_2, SQL_SouthCentralUS_MI_2, SQL_UKSouth_MI_2, SQL_WestEurope_MI_2, SQL_AustraliaSoutheast_MI_1, SQL_BrazilSouth_MI_1, SQL_CanadaCentral_MI_1, SQL_CanadaEast_MI_1, SQL_CentralUS_MI_1, SQL_EastAsia_MI_1, SQL_FranceCentral_MI_1, SQL_GermanyWestCentral_MI_1, SQL_CentralIndia_MI_1, SQL_JapanEast_MI_1, SQL_JapanWest_MI_1, SQL_NorthCentralUS_MI_1, SQL_UKWest_MI_1, SQL_WestUS_MI_1, SQL_AustraliaSoutheast_MI_2, SQL_BrazilSouth_MI_2, SQL_CanadaCentral_MI_2, SQL_CanadaEast_MI_2, SQL_CentralUS_MI_2, SQL_EastAsia_MI_2, SQL_FranceCentral_MI_2, SQL_GermanyWestCentral_MI_2, SQL_CentralIndia_MI_2, SQL_JapanEast_MI_2, SQL_JapanWest_MI_2, SQL_NorthCentralUS_MI_2, SQL_UKWest_MI_2, SQL_WestUS_MI_2, SQL_KoreaCentral_MI_1, SQL_KoreaCentral_MI_2, SQL_WestCentralUS_MI_1, SQL_WestCentralUS_MI_2, SQL_UAENorth_MI_1, SQL_SwitzerlandWest_MI_1, SQL_SwitzerlandNorth_MI_1, SQL_UAENorth_MI_2, SQL_SwitzerlandWest_MI_2, SQL_SwitzerlandNorth_MI_2, SQL_FranceSouth_MI_1, SQL_FranceSouth_MI_2, SQL_SouthAfricaNorth_MI_1, SQL_KoreaSouth_MI_1, SQL_UAECentral_MI_1, SQL_SouthAfricaNorth_MI_2, SQL_KoreaSouth_MI_2, SQL_UAECentral_MI_2, SQL_SouthIndia_MI_1, SQL_SouthIndia_MI_2, SQL_AustraliaCentral_MI_1, SQL_AustraliaCentral2_MI_1, SQL_AustraliaCentral_MI_2, SQL_AustraliaCentral2_MI_2, SQL_WestIndia_MI_1, SQL_WestIndia_MI_2, SQL_SouthAfricaWest_MI_1, SQL_SouthAfricaWest_MI_2, SQL_GermanyNorth_MI_1, SQL_GermanyNorth_MI_2, SQL_NorwayEast_MI_1, SQL_BrazilSoutheast_MI_1, SQL_NorwayWest_MI_1, SQL_WestUS3_MI_1, SQL_NorwayEast_MI_2, SQL_BrazilSoutheast_MI_2, SQL_NorwayWest_MI_2, SQL_WestUS3_MI_2. Defaults to SQL_Default."
  }
  default = "SQL_Default"
}

variable "dns_zone_partner_id" {
  type        = string
  description = "The ID of the SQL Managed Instance which will share the DNS zone."
  default     = ""
}

variable "collation" {
  type        = string
  description = "Specifies how the SQL Managed Instance will be collated."
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "minimum_tls_version" {
  type        = string
  description = "Specifies how the SQL Managed Instance will be collated."
  validation {
    condition     = contains(["1.0", "1.1", "1.2"], var.minimum_tls_version)
    error_message = "Valid values include 1.0, 1.1, 1.2."
  }
  default = "1.2"
}

variable "proxy_override" {
  type        = string
  description = "Specifies how the SQL Managed Instance will be accessed."
  validation {
    condition     = contains(["default", "proxy", "redirect"], lower(var.proxy_override))
    error_message = "Valid values include \"Default\", \"Proxy\", or \"Redirect\"."
  }
  default = "Default"
}

variable "public_data_endpoint_enabled" {
  type        = bool
  description = "Is the public data endpoint enabled?"
  default     = false
}

variable "storage_account_type" {
  type        = string
  description = "Specifies the storage account type used to store backups for this database."
  validation {
    condition     = contains(["lrs", "zrs", "grs"], lower(var.storage_account_type))
    error_message = "Possible values are \"GRS\", \"LRS\", or \"ZRS\"."
  }
  default = "GRS"
}

variable "timezone_id" {
  type        = string
  description = "The TimeZone ID that the SQL Managed Instance will be operating in."
  default     = "UTC"
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}

variable "private_dns_zone_group_name" {
  type        = string
  description = "DNS zone group is an association between the private DNS zone and the private endpoint"
  default     = ""
}
