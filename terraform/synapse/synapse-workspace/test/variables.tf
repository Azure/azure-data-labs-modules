resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "synadmin_username" {
  type    = string
  default = "sqladminuser"
}

variable "synadmin_password" {
  type      = string
  default   = "ThisIsNotVerySecure!"
  sensitive = true
}

variable "aad_login" {
  description = "AAD login."
  type = object({
    name      = string
    object_id = string
    tenant_id = string
  })
  default = {
    name      = "AzureAD Admin"
    object_id = "00000000-0000-0000-0000-000000000000"
    tenant_id = "00000000-0000-0000-0000-000000000000"
  }
}