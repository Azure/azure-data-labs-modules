variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[\\w]{0,87}$", var.basename))
    error_message = "The name must be between 0 and 87 characters, can contain only letters, numbers, and underscores."
  }
}

variable "account_id" {
  type        = string
  description = "The ID of the Data Share account in which the Data Share is created."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "kind" {
  type        = string
  description = "The kind of the Data Share."
  validation {
    condition     = contains(["copybased", "inplace"], lower(var.kind))
    error_message = "Valid values for kind are \"CopyBased\" or \"InPlace\"."
  }
  default = "CopyBased"
}

variable "description" {
  type        = string
  description = "The Data Share's description."
  validation {
    condition     = length(var.description) <= 100000
    error_message = "Length of description must not exceed 100,000 characters."
  }
  default = ""
}

variable "terms" {
  type        = string
  description = "The terms of the Data Share."
  validation {
    condition     = length(var.terms) <= 100000
    error_message = "Length of terms must not exceed 100,000 characters."
  }
  default = ""
}

variable "snapshot_schedule" {
  type = map(
    object(
      {
        name       = optional(string)
        recurrence = optional(string)
        start_time = optional(string)
      }
    )
  )
  description = <<EOF
  "name - The name of the snapshot schedule.
   recurrence - The interval of the synchronization with the source data. Possible values are Hour and Day.
   start_time - The synchronization with the source data's start time."
  EOF
  validation {
    condition     = length(var.snapshot_schedule) == 0 || (length(var.snapshot_schedule) == 1 && alltrue([for v in var.snapshot_schedule : contains(["hour", "day"], lower(v.recurrence))]) && alltrue([for v in var.snapshot_schedule : can(regex("^(\\d{4})-(\\d{2})-(\\d{2})(T(\\d{2}):(\\d{2}):(\\d{2}(?:\\.\\d*)?)((-(\\d{2}):(\\d{2})|Z)?))?$", v.start_time))]) && alltrue([for v in var.snapshot_schedule : length(v.name) > 0]))
    error_message = "Valid values for recurrence are \"Hour\" or \"Day\". Valid values for start_time are dates or date times in ISO 8601 format."
  }
  default = {}
}
