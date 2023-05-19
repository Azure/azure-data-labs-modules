variable "location" {
  type        = string
  description = "(Required) Location for the deployment"
}

variable "env" {
  type        = string
  description = "(Required) Environment for the deployment"
}

variable "sub" {
  type        = string
  description = "(Optional) Subscription identifier where the resources are being deployed"
  default     = ""
}

variable "location-map" {
  description = "Azure location map used for naming abbreviations"
  type        = map(any)
  default = {
    "Australia Central 2"  = "cau2",
    "Australia Central"    = "cau",
    "Australia East"       = "eau",
    "Australia Southeast"  = "seau",
    "australiacentral"     = "cau",
    "australiacentral2"    = "cau2",
    "australiaeast"        = "eau",
    "australiasoutheast"   = "seau",
    "Brazil South"         = "sbr",
    "brazilsouth"          = "sbr",
    "Canada Central"       = "cac",
    "Canada East"          = "eca",
    "canadacentral"        = "cac",
    "canadaeast"           = "eca",
    "Central India"        = "cin",
    "Central US"           = "cus",
    "centralindia"         = "cin",
    "centralus"            = "cus",
    "East Asia"            = "eaa",
    "East US 2"            = "eus2",
    "East US"              = "eus",
    "eastasia"             = "eaa",
    "eastus"               = "eus",
    "eastus2"              = "eus2",
    "France Central"       = "cfr",
    "France South"         = "sfr",
    "francecentral"        = "cfr",
    "francesouth"          = "sfr",
    "Germany North"        = "nge",
    "Germany West Central" = "wcge",
    "germanynorth"         = "nge",
    "germanywestcentral"   = "wcge",
    "Japan East"           = "eja",
    "Japan West"           = "wja",
    "japaneast"            = "eja",
    "japanwest"            = "wja",
    "Korea Central"        = "cko",
    "Korea South"          = "sko",
    "koreacentral"         = "cko",
    "koreasouth"           = "sko",
    "North Central US"     = "ncus",
    "North Europe"         = "eun",
    "northcentralus"       = "ncus",
    "northeurope"          = "eun",
    "South Africa North"   = "nsa",
    "South Africa West"    = "wsa",
    "South Central US"     = "scus",
    "South India"          = "sin",
    "southafricanorth"     = "nsa",
    "southafricawest"      = "wsa",
    "southcentralus"       = "scus",
    "Southeast Asia"       = "sea",
    "southeastasia"        = "sea",
    "southindia"           = "sin",
    "UAE Central"          = "cua",
    "UAE North"            = "nua",
    "uaecentral"           = "cua",
    "uaenorth"             = "nua",
    "UK South"             = "uks",
    "UK West"              = "ukw",
    "uksouth"              = "uks",
    "ukwest"               = "ukw",
    "West Central US"      = "wcus",
    "West Europe"          = "weu",
    "West India"           = "win",
    "West US 2"            = "wus2",
    "West US"              = "wus",
    "westcentralus"        = "wcus",
    "westeurope"           = "euw",
    "westindia"            = "win",
    "westus"               = "wus",
    "westus2"              = "wus2"
  }
}

#D.N.B
variable "sequence" {
  type = string
}

variable "app_name" {
  type        = string
  description = "Application name"
}

