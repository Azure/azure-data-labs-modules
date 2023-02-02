resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "address_prefixes" {
  type        = list(string)
  description = "value."
  default     = ["10.0.1.0/24"]
}