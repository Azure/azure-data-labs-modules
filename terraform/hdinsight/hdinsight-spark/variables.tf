variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{0,54}$", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename))
    error_message = "The name must be between 0 and 54 characters, can contain only letters, numbers, and hyphens. Must end with a letter or number."
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

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
}

variable "virtual_network_id" {
  type        = string
  description = "The ID of the vnet."
}

variable "cluster_version" {
  type        = string
  description = "Specifies the Version of HDInsights which should be used for this Cluster."
}

variable "component_version_spark" {
  type        = string
  description = "The version of Spark which should be used for this HDInsight Spark Cluster."
}

variable "gateway_username" {
  type        = string
  description = "The username used for the Ambari Portal."
}

variable "gateway_password" {
  type        = string
  description = "The password used for the Ambari Portal."
  sensitive   = true
}

variable "ssh_username" {
  type        = string
  description = "The username used for the ssh."
}

variable "ssh_password" {
  type        = string
  description = "The password used for the ssh."
  sensitive   = true
}

variable "roles_head_node_vm_size" {
  type        = string
  description = "The Size of the Virtual Machine which should be used as the Head Nodes."
}

variable "roles_worker_node_number_of_disks_per_node" {
  type        = number
  description = "The number of Data Disks which should be assigned to each Worker Node."
  default     = 1
}

variable "roles_worker_node_vm_size" {
  type        = string
  description = "The Size of the Virtual Machine which should be used as the Worker Nodes."
}

variable "roles_worker_node_target_instance_count" {
  type        = number
  description = "The number of instances which should be run for the Worker Nodes."
}

variable "roles_zookeeper_node_vm_size" {
  type        = string
  description = "The Size of the Virtual Machine which should be used as the Zookeeper Nodes."
}

variable "tier" {
  type        = string
  description = "Specifies the Tier which should be used for this HDInsight Cluster."
}

variable "metastore_sku" {
  type        = map(any)
  description = "SKUs to be used for each metastore."
  default = {
    ambari = "S0"
    hive   = "S0"
    oozie  = "S0"
  }
}

variable "storage_resource_id" {
  type        = string
  description = "The ID of the Storage Account."
}

variable "filesystem_id" {
  type        = string
  description = "The ID of the Gen2 Filesystem."
}

variable "storage_account_is_default" {
  type        = bool
  description = "Is this the Default Storage Account for the HDInsight Hadoop Cluster?"
  default     = true
}

variable "managed_identity_resource_id" {
  type        = string
  description = " The ID of Managed Identity to use for accessing the Gen2 filesystem."
}

variable "managed_identity_principal_id" {
  type        = string
  description = " The object ID of Managed Identity to use for accessing the Gen2 filesystem."
}

variable "ambari_server_name" {
  type        = string
  description = "The external Hive metastore's existing SQL server."
}

variable "ambari_database_name" {
  type        = string
  description = "The external Hive metastore's existing SQL database."
}

variable "ambari_database_administrator_login" {
  type        = string
  description = "The external Ambari metastore's existing SQL server admin username."
}

variable "ambari_database_administrator_login_password" {
  type        = string
  description = "The external Ambari metastore's existing SQL server admin password."
  sensitive   = true
}

variable "hive_server_name" {
  type        = string
  description = "The external Hive metastore's existing SQL server."
}

variable "hive_database_name" {
  type        = string
  description = "The external Hive metastore's existing SQL database."
}

variable "hive_database_administrator_login" {
  type        = string
  description = "The external Hive metastore's existing SQL server admin username."
}

variable "hive_database_administrator_login_password" {
  type        = string
  description = "The external Hive metastore's existing SQL server admin password."
  sensitive   = true
}

variable "oozie_server_name" {
  type        = string
  description = "The external Hive metastore's existing SQL server."
}

variable "oozie_database_name" {
  type        = string
  description = "The external Hive metastore's existing SQL database."
}

variable "oozie_database_administrator_login" {
  type        = string
  description = "The external Hive metastore's existing SQL server admin username."
}

variable "oozie_database_administrator_login_password" {
  type        = string
  description = "The external Hive metastore's existing SQL server admin password."
  sensitive   = true
}

# variable "autoscale_schedules" {
#   type = list(object({
#     days                  = list(string)
#     time                  = string
#     target_instance_count = number
#   }))
# }