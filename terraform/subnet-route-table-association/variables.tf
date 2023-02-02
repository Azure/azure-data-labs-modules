variable "subnet_id" {
  type        = string
  description = "The ID of the Network Security Group which should be associated with the Subnet."
}

variable "route_table_id" {
  type        = string
  description = "The ID of the Route Table."
}