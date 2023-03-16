# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster

locals {
  default_node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  merged_default_node_pool = merge(local.default_node_pool, var.default_node_pool)

  network_profile = {
    network_plugin        = "azure" // Requiere "azure or kubenet or none"
    network_mode          = null    // Optional bridge or transparent 
    network_policy        = "azure" // Optional calico o azure
    dns_service_ip        = null    // Optional
    docker_bridge_cidr    = null
    outbound_type         = "loadBalancer"
    pod_cidr              = null
    pod_cidrs             = null
    service_cidrs         = null
    ip_versions           = ["IPv4"]
    load_balancer_sku     = "standard"
    load_balancer_profile = null
    nat_gateway_profile   = null
  }

  merged_network_profile = merge(local.network_profile, var.network_profile)

  api_server_authorized_ip_ranges = [
    "0.0.0.0/0"
  ]
}

resource "azurerm_kubernetes_cluster" "adl_aks" {
  name                = "aks-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  default_node_pool {
    name       = local.merged_default_node_pool.name
    node_count = local.merged_default_node_pool.node_count
    vm_size    = local.merged_default_node_pool.vm_size
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin     = local.merged_network_profile.network_plugin
    network_mode       = local.merged_network_profile.network_mode
    network_policy     = local.merged_network_profile.network_policy
    dns_service_ip     = local.merged_network_profile.dns_service_ip
    docker_bridge_cidr = local.merged_network_profile.docker_bridge_cidr
    outbound_type      = local.merged_network_profile.outbound_type
    pod_cidr           = local.merged_network_profile.pod_cidr
    # pod_cidrs             = local.merged_network_profile.pod_cidrs
    # service_cidrs         = local.merged_network_profile.service_cidrs
    ip_versions       = local.merged_network_profile.ip_versions
    load_balancer_sku = local.merged_network_profile.load_balancer_sku
    # load_balancer_profile = local.merged_network_profile.load_balancer_profile
    # nat_gateway_profile   = local.merged_network_profile.nat_gateway_profile
  }
  api_server_access_profile {
    authorized_ip_ranges = var.api_server_authorized_ip_ranges
  }
  role_based_access_control_enabled = var.role_based_access_control_enabled
  tags                              = var.tags

  count = var.module_enabled ? 1 : 0
}