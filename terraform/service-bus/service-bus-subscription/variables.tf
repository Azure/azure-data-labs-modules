variable "basename" {
  type        = string
  description = "Basename of the module."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "topic_id" {
  type        = string
  description = "The ID of the ServiceBus Topic to create this Subscription in."
}

variable "max_delivery_count" {
  type        = number
  description = "The maximum number of deliveries."
  default     = 1
}

variable "filter_type" {
  type        = string
  description = "Type of filter to be applied to a BrokeredMessage."
  default     = "SqlFilter"
}

variable "sql_filter" {
  type        = string
  description = "Represents a filter written in SQL language-based syntax that to be evaluated against a BrokeredMessage."
  default     = "colour = 'red'"
}