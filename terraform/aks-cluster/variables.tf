variable "basename" {
  type        = string
  description = "Basename of the module"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource"
}


variable "dns_prefix" {
  type        = string
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created"
}


variable "default_node_pool" {
  type        = map(string)
  default     = {}
  description = <<EOT
    " (Optional) A list of Mongo databases to create within a Cosmos DB Account as defined below. The Account type must support Mongo databases.
        name - (Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created.
        node_count - (Required) he initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000 and between min_count and max_count.
        vm_size - (Required) The size of the Virtual Machine, such as Standard_DS2_v2. Changing this forces a new resource to be created.
    "
  EOT
}

