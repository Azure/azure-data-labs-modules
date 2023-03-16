<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.adl_aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_default_node_pool"></a> [default\_node\_pool](#input\_default\_node\_pool) | "name - The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created.<br>     node\_count - The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000 and between min\_count and max\_count.<br>     vm\_size - The size of the Virtual Machine, such as Standard\_DS2\_v2. Changing this forces a new resource to be created." | `map(string)` | `{}` | no |
| <a name="input_network_profile"></a> [network\_profile](#input\_network\_profile) | "network\_plugin - Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created.<br>     network\_mode - Network mode to be used with Azure CNI. Possible values are bridge and transparent. Changing this forces a new resource to be created<br>     network\_policy - Sets up network policy to be used with Azure CNI. Currently supported values are calico and azure.<br>     dns\_service\_ip - IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns).Changing this forces a new resource to be created.<br>     docker\_bridge\_cidr - IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created.<br>     outbound\_type - The outbound (egress) routing method which should be used for this Kubernetes Cluster.Possible values are loadBalancer, userDefinedRouting, managedNATGateway and userAssignedNATGateway.<br>     pod\_cidr - The CIDR to use for pod IP addresses. This field can only be set when network\_plugin is set to kubenet. Changing this forces a new resource to be created.<br>     pod\_cidrs - A list of CIDRs to use for pod IP addresses<br>     service\_cidrs - A list of CIDRs to use for Kubernetes services. For single-stack networking a single IPv4 CIDR is expected.<br>     ip\_versions - Specifies a list of IP versions the Kubernetes Cluster will use to assign IP addresses to its nodes and pods. Possible values are IPv4 and/or IPv6. IPv4 must always be specified.<br>     load\_balancer\_sku - Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to standard.<br>     load\_balancer\_profile - A load\_balancer\_profile block. This can only be specified when load\_balancer\_sku is set to standard.<br>     nat\_gateway\_profile - A nat\_gateway\_profile block. This can only be specified when load\_balancer\_sku is set to standard and outbound\_type is set to managedNATGateway or userAssignedNATGateway. | `map(string)` | `{}` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | The IP ranges to allow for incoming traffic to the server nodes. By default 0.0.0.0/0. | `list(string)` | `[]` | no |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Whether Role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to true. Changing this forces a new resource to be created. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Managed Kubernetes Cluster. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Managed Kubernetes Cluster. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Managed Kubernetes Cluster exists. |
| <a name="output_all"></a> [all](#output\_all) | All attributes exported by the Managed Kubernetes Cluster. |
<!-- END_TF_DOCS -->