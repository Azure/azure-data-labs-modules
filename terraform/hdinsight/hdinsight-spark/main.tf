# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/hdinsight_spark_cluster

resource "azurerm_hdinsight_spark_cluster" "adl_hdi_spark" {
  name                = "spark${var.basename}"
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_version     = var.cluster_version
  tier                = var.tier
  component_version {
    spark = var.component_version_spark
  }
  gateway {
    username = var.gateway_username
    password = var.gateway_password
  }
  roles {
    head_node {
      vm_size            = var.roles_head_node_vm_size
      username           = var.ssh_username
      password           = var.ssh_password
      subnet_id          = var.subnet_id
      virtual_network_id = var.virtual_network_id
    }
    worker_node {
      vm_size               = var.roles_worker_node_vm_size
      username              = var.ssh_username
      password              = var.ssh_password
      subnet_id             = var.subnet_id
      virtual_network_id    = var.virtual_network_id
      target_instance_count = var.roles_worker_node_target_instance_count
      #   autoscale {
      #     recurrence {
      #       timezone = "E. South America Standard Time"
      #       dynamic "schedule" {
      #         for_each = var.autoscale_schedules
      #         content {
      #           days                  = schedule.value.days
      #           time                  = schedule.value.time
      #           target_instance_count = schedule.value.target_instance_count
      #         }
      #       }
      #     }
      #   }
    }
    zookeeper_node {
      vm_size            = var.roles_zookeeper_node_vm_size
      username           = var.ssh_username
      password           = var.ssh_password
      subnet_id          = var.subnet_id
      virtual_network_id = var.virtual_network_id
    }
  }
  # storage_account {
  #   storage_container_id = azurerm_storage_container.hdi_st_container[0].id
  #   storage_account_key  = azurerm_storage_account.hdi_st.primary_access_key
  #   is_default           = var.storage_account_is_default
  # }
  storage_account_gen2 {
    storage_resource_id          = var.storage_resource_id
    filesystem_id                = var.filesystem_id
    is_default                   = var.storage_account_is_default
    managed_identity_resource_id = var.managed_identity_resource_id
  }
  metastores {
    ambari {
      server        = join("", [var.ambari_server_name, ".database.windows.net"])
      database_name = var.ambari_database_name
      username      = var.ambari_database_administrator_login
      password      = var.ambari_database_administrator_login_password
    }
    hive {
      server        = join("", [var.hive_server_name, ".database.windows.net"])
      database_name = var.hive_database_name
      username      = var.hive_database_administrator_login
      password      = var.hive_database_administrator_login_password
    }
    oozie {
      server        = join("", [var.oozie_server_name, ".database.windows.net"])
      database_name = var.oozie_database_name
      username      = var.oozie_database_administrator_login
      password      = var.oozie_database_administrator_login_password
    }
  }
  tags = var.tags
}

resource "azurerm_role_assignment" "hdi_spark_st_role_id_sbdo" {
  scope                = var.storage_resource_id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = var.managed_identity_principal_id
}