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

variable "private_cluster_enabled" {
  type        = bool
  description = "(Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created."
  default     = false
}

variable "default_node_pool" {
  type        = map(string)
  default     = {}
  description = <<EOT
    "   name - (Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created.
        node_count - (Required) he initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000 and between min_count and max_count.
        vm_size - (Required) The size of the Virtual Machine, such as Standard_DS2_v2. Changing this forces a new resource to be created.
        vnet_subnet_id = (Optional) The ID of the Subnet where this Node Pool should exist. Changing this forces a new resource to be created.
    "
  EOT
}

variable "network_profile" {
  type        = map(string)
  default     = {}
  description = <<EOT
    "   network_plugin - (Required) (Required) Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created.
        network_mode  - (Optional) Network mode to be used with Azure CNI. Possible values are bridge and transparent. Changing this forces a new resource to be created
        network_policy -  (Optional) Sets up network policy to be used with Azure CNI. Currently supported values are calico and azure.
        dns_service_ip  - (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns).Changing this forces a new resource to be created.
        docker_bridge_cidr - (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created.
        outbound_type - (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster.Possible values are loadBalancer, userDefinedRouting, managedNATGateway and userAssignedNATGateway.
        pod_cidr - (Optional) The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created.
        pod_cidrs - (Optional) A list of CIDRs to use for pod IP addresses
        service_cidrs - (Optional) A list of CIDRs to use for Kubernetes services. For single-stack networking a single IPv4 CIDR is expected.
        ip_versions = (Optional) Specifies a list of IP versions the Kubernetes Cluster will use to assign IP addresses to its nodes and pods. Possible values are IPv4 and/or IPv6. IPv4 must always be specified.
        load_balancer_sku =  (Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to standard.
        load_balancer_profile  = (Optional) A load_balancer_profile block. This can only be specified when load_balancer_sku is set to standard.
        nat_gateway_profile = - (Optional) A nat_gateway_profile block. This can only be specified when load_balancer_sku is set to standard and outbound_type is set to managedNATGateway or userAssignedNATGateway.
  EOT
}
variable "api_server_authorized_ip_ranges" {
  type        = list(string)
  default     = []
  description = "The IP ranges to allow for incoming traffic to the server nodes. By default 0.0.0.0/0"
}

variable "role_based_access_control_enabled" {
  type        = bool
  default     = true
  description = "(Optional) - Whether Role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to true. Changing this forces a new resource to be created."
}


variable "is_sec_module" {
  type        = bool
  description = "Is secure module?"
  default     = true
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = true
}

variable "vnet_subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated"
  default     = null
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include"
  default     = []
}

variable "vnet_private_endpoint_subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated"
  default     = null
}



