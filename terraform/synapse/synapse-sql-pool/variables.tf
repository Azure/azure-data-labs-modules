variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = !can(regex("[<>*%&:\\/?@-]+", var.basename)) && can(regex("^[\\S]{1,60}$", var.basename)) && !can(regex("[.\\s]+$", var.basename))
    error_message = "Names must be between 1 and 60 characters,  cannot contain special characters <,>,*,%,&,:,\\,/,?,@,-, or end with '.' or space."
  }
}

variable "synapse_workspace_id" {
  type        = string
  description = "The ID of the Synapse workspace."
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Synapse Sql Pool."
  validation {
    condition     = contains(["dw100c", "dw200c", "dw300c", "dw400c", "dw500c", "dw1000c", "dw1500c", "dw2000c", "dw2500c", "dw3000c", "dw5000c", "dw6000c", "dw7500c", "dw10000c", "dw15000c", "dw30000c"], lower(var.sku_name))
    error_message = "Valid values for sku_name are \"DW100c\", \"DW200c\", \"DW300c\", \"DW400c\", \"DW500c\", \"DW1000c\", \"DW1500c\", \"DW2000c\", \"DW2500c\", \"DW3000c\", \"DW5000c\", \"DW6000c\", \"DW7500c\", \"DW10000c\", \"DW15000c\", or \"DW30000c\"."
  }
  default = "DW100c"
}

variable "create_mode" {
  type        = string
  description = "Specifies how to create the Sql Pool."
  validation {
    condition     = contains(["default", "recovery", "pointintimerestore"], lower(var.create_mode))
    error_message = "Valid values for sku_name are \"Default\", \"Recovery\", or \"PointInTimeRestore\"."
  }
  default = "Default"
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}