variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{1,59}", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename))
    error_message = "The name must be between 1 and 59 characters and can contain only letters, numbers, underscores, and hyphens. The name must  end with a letter or number."
  }
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
  description = "A mapping of tags which should be assigned to the deployed resource."
  default     = {}
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
}

variable "default_node_pool" {
  type        = map(string)
  description = <<EOT
    "name - The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created.
     node_count - The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000 and between min_count and max_count.
     vm_size - The size of the Virtual Machine, such as Standard_DS2_v2. Changing this forces a new resource to be created."
  EOT
  default     = {}
}

variable "network_profile" {
  type        = map(string)
  description = <<EOT
    "network_plugin - Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created.
     network_mode - Network mode to be used with Azure CNI. Possible values are bridge and transparent. Changing this forces a new resource to be created
     network_policy - Sets up network policy to be used with Azure CNI. Currently supported values are calico and azure.
     dns_service_ip - IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns).Changing this forces a new resource to be created.
     docker_bridge_cidr - IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created.
     outbound_type - The outbound (egress) routing method which should be used for this Kubernetes Cluster.Possible values are loadBalancer, userDefinedRouting, managedNATGateway and userAssignedNATGateway.
     pod_cidr - The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created.
     pod_cidrs - A list of CIDRs to use for pod IP addresses
     service_cidrs - A list of CIDRs to use for Kubernetes services. For single-stack networking a single IPv4 CIDR is expected.
     ip_versions - Specifies a list of IP versions the Kubernetes Cluster will use to assign IP addresses to its nodes and pods. Possible values are IPv4 and/or IPv6. IPv4 must always be specified.
     load_balancer_sku - Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to standard.
     load_balancer_profile - A load_balancer_profile block. This can only be specified when load_balancer_sku is set to standard.
     nat_gateway_profile - A nat_gateway_profile block. This can only be specified when load_balancer_sku is set to standard and outbound_type is set to managedNATGateway or userAssignedNATGateway.
  EOT
  default     = {}
}

variable "api_server_authorized_ip_ranges" {
  type        = list(string)
  description = "The IP ranges to allow for incoming traffic to the server nodes. By default 0.0.0.0/0."
  validation {
    condition     = length(var.api_server_authorized_ip_ranges) == 0 || alltrue([for v in var.api_server_authorized_ip_ranges : can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))\\/([0-9]|[12][0-9]|3[0-2])$", v))])
    error_message = "Invalid IP range in CIDR format found in the list."
  }
  default = []
}

variable "role_based_access_control_enabled" {
  type        = bool
  description = "Whether Role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to true. Changing this forces a new resource to be created."
  default     = true
}