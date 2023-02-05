variable "basename" {
  type        = string
  description = "Basename of the module."
}

variable "rg_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}", var.rg_name)) && can(regex("[\\w]+$", var.rg_name))
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

variable "compatibility_level" {
  type        = string
  description = "Specifies the compatibility level for this job - which controls certain runtime behaviours of the streaming job."
  default     = "1.2"
}

variable "data_locale" {
  type        = string
  description = "Specifies the Data Locale of the Job, which should be a supported .NET Culture."
  default     = "en-GB"
}

variable "events_late_arrival_max_delay_in_seconds" {
  type        = number
  description = "Specifies the maximum tolerable delay in seconds where events arriving late could be included."
  default     = 60
}

variable "events_out_of_order_max_delay_in_seconds" {
  type        = number
  description = "Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order."
  default     = 50
}

variable "events_out_of_order_policy" {
  type        = string
  description = "Specifies the policy which should be applied to events which arrive out of order in the input event stream."
  default     = "Adjust"
}

variable "output_error_policy" {
  type        = string
  description = "Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed (such as missing column values, column values of wrong type or size)."
  default     = "Drop"
}

variable "streaming_units" {
  type        = number
  description = "Specifies the number of streaming units that the streaming job uses."
  default     = 3
}