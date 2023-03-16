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
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "compatibility_level" {
  type        = string
  description = "Specifies the compatibility level for this job - which controls certain runtime behaviours of the streaming job."
  validation {
    condition     = contains(["1.0", "1.1", "1.2"], var.compatibility_level)
    error_message = "Valid values for compatibility_level are \"1.0\", \"1.1\", or \"1.2\"."
  }
  default = "1.2"
}

variable "data_locale" {
  type        = string
  description = "Specifies the Data Locale of the Job, which should be a supported .NET Culture."
  default     = "en-GB"
}

variable "events_late_arrival_max_delay_in_seconds" {
  type        = number
  description = "Specifies the maximum tolerable delay in seconds where events arriving late could be included."
  validation {
    condition     = var.events_late_arrival_max_delay_in_seconds >= -1 && var.events_late_arrival_max_delay_in_seconds <= 1814399 && floor(var.events_late_arrival_max_delay_in_seconds) == var.events_late_arrival_max_delay_in_seconds
    error_message = "Supported range is -1 (indefinite) to 1814399 (20d 23h 59m 59s)."
  }
  default = 60
}

variable "events_out_of_order_max_delay_in_seconds" {
  type        = number
  description = "Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order."
  validation {
    condition     = var.events_out_of_order_max_delay_in_seconds >= 0 && var.events_out_of_order_max_delay_in_seconds <= 599 && floor(var.events_out_of_order_max_delay_in_seconds) == var.events_out_of_order_max_delay_in_seconds
    error_message = "Supported range is 0 to 599 (9m 59s)."
  }
  default = 50
}

variable "events_out_of_order_policy" {
  type        = string
  description = "Specifies the policy which should be applied to events which arrive out of order in the input event stream."
  validation {
    condition     = contains(["drop", "adjust"], lower(var.events_out_of_order_policy))
    error_message = "Valid values for events_out_of_order_policy are \"Drop\", or \"Adjust\"."
  }
  default = "Adjust"
}

variable "output_error_policy" {
  type        = string
  description = "Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed (such as missing column values, column values of wrong type or size)."
  validation {
    condition     = contains(["drop", "stop"], lower(var.output_error_policy))
    error_message = "Valid values for output_error_policy are \"Drop\", or \"Stop\"."
  }
  default = "Drop"
}

variable "streaming_units" {
  type        = number
  description = "Specifies the number of streaming units that the streaming job uses."
  validation {
    condition     = floor(var.streaming_units) == var.streaming_units && (contains([1, 3, 6], var.streaming_units) || (var.streaming_units % 6 == 0 && var.streaming_units <= 120))
    error_message = "Valid values for output_error_policy are \"Drop\", or \"Stop\"."
  }
  default = 3
}