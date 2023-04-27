variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{0,60}$", var.basename))
    error_message = "The name must be between 0 and 60 characters, can contain only alphanumeric characters, underscores, and hyphens."
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
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "sku" {
  type        = string
  description = "The sku to use for the Databricks Workspace."
  validation {
    condition     = contains(["standard", "premium", "trial"], lower(var.sku))
    error_message = "Valid values for sku are \"Standard\", \"Premium\", or \"Trial\"."
  }
  default = "premium"
}

variable "public_subnet_name" {
  type        = string
  description = "The name of the Public (Host) Subnet within the Virtual Network."
  validation {
    condition     = (can(regex("^[-\\w\\.]{1,80}$", var.public_subnet_name)) && can(regex("^[0-9a-zA-Z]+", var.public_subnet_name)) && can(regex("[\\w]+$", var.public_subnet_name))) || var.public_subnet_name == null
    error_message = "The name for the subnet must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
  default = null
}

variable "private_subnet_name" {
  type        = string
  description = "The name of the Private (Container) Subnet within the Virtual Network."
  validation {
    condition     = (can(regex("^[-\\w\\.]{1,80}$", var.private_subnet_name)) && can(regex("^[0-9a-zA-Z]+", var.private_subnet_name)) && can(regex("[\\w]+$", var.private_subnet_name))) || var.private_subnet_name == null
    error_message = "The name for the subnet must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
  default = null
}

variable "virtual_network_id" {
  type        = string
  description = "The ID of a Virtual Network where this Databricks Cluster should be created."
  default     = null
}

variable "vnet_address_prefix" {
  type        = string
  description = "Address prefix for Managed virtual network. Changing this forces a new resource to be created."
  default     = "10.139"
}

variable "public_subnet_network_security_group_association_id" {
  type        = string
  description = "The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the public_subnet_name field."
  default     = null
}

variable "private_subnet_network_security_group_association_id" {
  type        = string
  description = "The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the private_subnet_name field."
  default     = null
}

variable "no_public_ip" {
  type        = bool
  description = "Are public IP Addresses not allowed?"
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Should the Databricks Workspace be accesible through the public network?"
  default     = false
}

variable "is_private_endpoint" {
  type        = bool
  description = "Whether private endpoints are enabled to access the resource."
  default     = true
}

variable "private_link_deployment_type" {
  type        = string
  description = "Type of configuration for Private Link. In Standard configuration, there are separate private endpoints for frontend and backend. In Simplified configuration, there is a single private endpoint for UI and API. In Webauth configuration, only a webauth private endpoint is configured."
  validation {
    condition     = contains(["standard", "simplified", "webauth"], lower(var.private_link_deployment_type))
    error_message = "Valid values for private_link_deployment_type are \"standard\", \"simplified\" or  \"webauth\"."
  }
  default = "simplified"
}

variable "frontend_private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include for the frontend. Must be provided when private_link_deployment_type is standard"
  default     = []
}

variable "backend_private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include for the backend. Must be provided when is_private_endpoint is true"
  default     = []
}
variable "backend_dbfs_private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include for the backend connection to the Databricks File System Storage Account. Must be provided when is_private_endpoint is true"
  default     = []
}

variable "frontend_subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for the user access Private Endpoints. Must be provided when private_link_deployment_type is standard"
  default     = null
}

variable "backend_subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for the backend Private Endpoint. Must be provided when is_private_endpoint is true"
  default     = null
}

variable "is_web_auth_workspace" {
  type        = string
  description = "Should this Azure Databricks Workspace Instance be used for Private Endpoint Web Authentication? There must be only one per region."
  default     = false
}

variable "enable_ip_access_list" {
  type        = bool
  description = "Enable IP access lists."
  default     = false
}

variable "allow_ip_list" {
  type        = list(string)
  description = "Specifies the list of IPs allowed to the workspace."
  validation {
    condition     = length(var.allow_ip_list) == 0 || alltrue([for v in var.allow_ip_list : can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))(\\/([0-9]|[12][0-9]|3[0-2]))?$", v))])
    error_message = "Invalid IP or IP range in CIDR format found in the list."
  }
  default = []
}

variable "block_ip_list" {
  type        = list(string)
  description = "Specifies the list of IPs blocked to the workspace."
  validation {
    condition     = length(var.block_ip_list) == 0 || alltrue([for v in var.block_ip_list : can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))(\\/([0-9]|[12][0-9]|3[0-2]))?$", v))])
    error_message = "Invalid IP or IP range in CIDR format found in the list."
  }
  default = []
}

variable "machine_learning_workspace_id" {
  type        = string
  description = "The ID of a Azure Machine Learning workspace to link with Databricks workspace. Changing this forces a new resource to be created."
  default     = null
}

variable "storage_account_name" {
  type        = string
  description = "Default Databricks File Storage account name. Defaults to a randomized name(e.g. dbstoragel6mfeghoe5kxu). Changing this forces a new resource to be created."
  default     = null
}

variable "storage_account_sku_name" {
  type        = string
  description = "Storage account SKU name. Possible values include Standard_LRS, Standard_GRS, Standard_RAGRS, Standard_GZRS, Standard_RAGZRS, Standard_ZRS, Premium_LRS or Premium_ZRS. Changing this forces a new resource to be created."
  validation {
    condition     = contains(["Standard_LRS", "Standard_GRS", "Standard_RAGRS", "Standard_GZRS", "Standard_RAGZRS", "Standard_ZRS", "Premium_LRS", "StandardPremium_ZRS_GRS"], var.storage_account_sku_name)
    error_message = "Valid values for storage_account_sku_name include Standard_LRS, Standard_GRS, Standard_RAGRS, Standard_GZRS, Standard_RAGZRS, Standard_ZRS, Premium_LRS or Premium_ZRS."
  }
  default = "Standard_GRS"
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "Is the Databricks File System root file system enabled with a secondary layer of encryption with platform managed keys? This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created."
  default     = false
}

variable "customer_managed_key_enabled" {
  type        = bool
  description = "Is the workspace enabled for customer managed key encryption? If true this enables the Managed Identity for the managed storage account. This field is only valid if the Databricks Workspace sku is set to premium."
  default     = false
}

variable "managed_services_cmk_key_vault_key_id" {
  type        = string
  description = "Customer managed encryption properties for the Databricks Workspace managed resources(e.g. Notebooks and Artifacts)."
  default     = null
}

variable "managed_disk_cmk_key_vault_key_id" {
  type        = string
  description = "Customer managed encryption properties for the Databricks Workspace managed disks."
  default     = null
}

variable "managed_disk_cmk_rotation_to_latest_version_enabled" {
  type        = bool
  description = "Whether customer managed keys for disk encryption will automatically be rotated to the latest version."
  default     = null
}

variable "load_balancer_backend_address_pool_id" {
  type        = string
  description = "Resource ID of the Outbound Load balancer Backend Address Pool for Secure Cluster Connectivity (No Public IP) workspace. Changing this forces a new resource to be created. This property is currently disabled and has no effect."
  default     = null
}

variable "nat_gateway_name" {
  type        = string
  description = "Name of the NAT gateway for Secure Cluster Connectivity (No Public IP) workspace subnets. Changing this forces a new resource to be created."
  default     = "nat-gateway"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the Public IP for No Public IP workspace with managed vNet. Changing this forces a new resource to be created."
  default     = "nat-gw-public-ip"
}