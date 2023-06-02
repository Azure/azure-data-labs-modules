<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_databricks_workspace.adl_databricks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace) | resource |
| [databricks_ip_access_list.adb_ws_allow-list](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/ip_access_list) | resource |
| [databricks_ip_access_list.adb_ws_block-list](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/ip_access_list) | resource |
| [databricks_workspace_conf.adb_ws_conf](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/workspace_conf) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The sku to use for the Databricks Workspace. | `string` | `"premium"` | no |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | The name of the Public (Host) Subnet within the Virtual Network. | `string` | `null` | no |
| <a name="input_private_subnet_name"></a> [private\_subnet\_name](#input\_private\_subnet\_name) | The name of the Private (Container) Subnet within the Virtual Network. | `string` | `null` | no |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | The ID of a Virtual Network where this Databricks Cluster should be created. | `string` | `null` | no |
| <a name="input_vnet_address_prefix"></a> [vnet\_address\_prefix](#input\_vnet\_address\_prefix) | Address prefix for Managed virtual network. Changing this forces a new resource to be created. | `string` | `"10.139"` | no |
| <a name="input_public_subnet_network_security_group_association_id"></a> [public\_subnet\_network\_security\_group\_association\_id](#input\_public\_subnet\_network\_security\_group\_association\_id) | The resource ID of the azurerm\_subnet\_network\_security\_group\_association resource which is referred to by the public\_subnet\_name field. | `string` | `null` | no |
| <a name="input_private_subnet_network_security_group_association_id"></a> [private\_subnet\_network\_security\_group\_association\_id](#input\_private\_subnet\_network\_security\_group\_association\_id) | The resource ID of the azurerm\_subnet\_network\_security\_group\_association resource which is referred to by the private\_subnet\_name field. | `string` | `null` | no |
| <a name="input_no_public_ip"></a> [no\_public\_ip](#input\_no\_public\_ip) | Are public IP Addresses not allowed? | `bool` | `true` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Should the Databricks Workspace be accesible through the public network? | `bool` | `false` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_private_link_deployment_type"></a> [private\_link\_deployment\_type](#input\_private\_link\_deployment\_type) | Type of configuration for Private Link. In Standard configuration, there are separate private endpoints for frontend and backend. In Simplified configuration, there is a single private endpoint for UI and API. In Webauth configuration, only a webauth private endpoint is configured. | `string` | `"simplified"` | no |
| <a name="input_frontend_private_dns_zone_ids"></a> [frontend\_private\_dns\_zone\_ids](#input\_frontend\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include for the frontend. Must be provided when private\_link\_deployment\_type is standard | `list(string)` | `[]` | no |
| <a name="input_backend_private_dns_zone_ids"></a> [backend\_private\_dns\_zone\_ids](#input\_backend\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include for the backend. Must be provided when is\_private\_endpoint is true | `list(string)` | `[]` | no |
| <a name="input_backend_dbfs_private_dns_zone_ids"></a> [backend\_dbfs\_private\_dns\_zone\_ids](#input\_backend\_dbfs\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include for the backend connection to the Databricks File System Storage Account. Must be provided when is\_private\_endpoint is true | `list(string)` | `[]` | no |
| <a name="input_frontend_subnet_id"></a> [frontend\_subnet\_id](#input\_frontend\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for the user access Private Endpoints. Must be provided when private\_link\_deployment\_type is standard | `string` | `null` | no |
| <a name="input_backend_subnet_id"></a> [backend\_subnet\_id](#input\_backend\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for the backend Private Endpoint. Must be provided when is\_private\_endpoint is true | `string` | `null` | no |
| <a name="input_is_web_auth_workspace"></a> [is\_web\_auth\_workspace](#input\_is\_web\_auth\_workspace) | Should this Azure Databricks Workspace Instance be used for Private Endpoint Web Authentication? There must be only one per region. | `string` | `false` | no |
| <a name="input_enable_ip_access_list"></a> [enable\_ip\_access\_list](#input\_enable\_ip\_access\_list) | Enable IP access lists. | `bool` | `false` | no |
| <a name="input_allow_ip_list"></a> [allow\_ip\_list](#input\_allow\_ip\_list) | Specifies the list of IPs allowed to the workspace. | `list(string)` | `[]` | no |
| <a name="input_block_ip_list"></a> [block\_ip\_list](#input\_block\_ip\_list) | Specifies the list of IPs blocked to the workspace. | `list(string)` | `[]` | no |
| <a name="input_machine_learning_workspace_id"></a> [machine\_learning\_workspace\_id](#input\_machine\_learning\_workspace\_id) | The ID of a Azure Machine Learning workspace to link with Databricks workspace. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Default Databricks File Storage account name. Defaults to a randomized name(e.g. dbstoragel6mfeghoe5kxu). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_storage_account_sku_name"></a> [storage\_account\_sku\_name](#input\_storage\_account\_sku\_name) | Storage account SKU name. Possible values include Standard\_LRS, Standard\_GRS, Standard\_RAGRS, Standard\_GZRS, Standard\_RAGZRS, Standard\_ZRS, Premium\_LRS or Premium\_ZRS. Changing this forces a new resource to be created. | `string` | `"Standard_GRS"` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Is the Databricks File System root file system enabled with a secondary layer of encryption with platform managed keys? This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_customer_managed_key_enabled"></a> [customer\_managed\_key\_enabled](#input\_customer\_managed\_key\_enabled) | Is the workspace enabled for customer managed key encryption? If true this enables the Managed Identity for the managed storage account. This field is only valid if the Databricks Workspace sku is set to premium. | `bool` | `false` | no |
| <a name="input_managed_services_cmk_key_vault_key_id"></a> [managed\_services\_cmk\_key\_vault\_key\_id](#input\_managed\_services\_cmk\_key\_vault\_key\_id) | Customer managed encryption properties for the Databricks Workspace managed resources(e.g. Notebooks and Artifacts). | `string` | `null` | no |
| <a name="input_managed_disk_cmk_key_vault_key_id"></a> [managed\_disk\_cmk\_key\_vault\_key\_id](#input\_managed\_disk\_cmk\_key\_vault\_key\_id) | Customer managed encryption properties for the Databricks Workspace managed disks. | `string` | `null` | no |
| <a name="input_managed_disk_cmk_rotation_to_latest_version_enabled"></a> [managed\_disk\_cmk\_rotation\_to\_latest\_version\_enabled](#input\_managed\_disk\_cmk\_rotation\_to\_latest\_version\_enabled) | Whether customer managed keys for disk encryption will automatically be rotated to the latest version. | `bool` | `null` | no |
| <a name="input_load_balancer_backend_address_pool_id"></a> [load\_balancer\_backend\_address\_pool\_id](#input\_load\_balancer\_backend\_address\_pool\_id) | Resource ID of the Outbound Load balancer Backend Address Pool for Secure Cluster Connectivity (No Public IP) workspace. Changing this forces a new resource to be created. This property is currently disabled and has no effect. | `string` | `null` | no |
| <a name="input_nat_gateway_name"></a> [nat\_gateway\_name](#input\_nat\_gateway\_name) | Name of the NAT gateway for Secure Cluster Connectivity (No Public IP) workspace subnets. Changing this forces a new resource to be created. | `string` | `"nat-gateway"` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Name of the Public IP for No Public IP workspace with managed vNet. Changing this forces a new resource to be created. | `string` | `"nat-gw-public-ip"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Azure Databricks. |
| <a name="output_workspace_url"></a> [workspace\_url](#output\_workspace\_url) | The URL used to connect to the workspace of the Azure Databricks. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The unique identifier of the databricks workspace in Databricks control plane. |
| <a name="output_name"></a> [name](#output\_name) | The name of the instance of Azure Databricks. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the instance of Azure Databricks exists. |
| <a name="output_managed_resource_group_id"></a> [managed\_resource\_group\_id](#output\_managed\_resource\_group\_id) | The ID of the Managed Resource Group created by the Databricks Workspace. |
| <a name="output_storage_account_identity"></a> [storage\_account\_identity](#output\_storage\_account\_identity) | Block exports the principal\_id, tenant\_id and type of the internal databricks storage account identity for enabling Customer Managed Keys. |
| <a name="output_managed_disk_identity"></a> [managed\_disk\_identity](#output\_managed\_disk\_identity) | Block exports the principal\_id, tenant\_id and type of the internal databricks disks identity for enabling Customer Managed Keys. |
| <a name="output_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#output\_disk\_encryption\_set\_id) | The ID of Managed Disk Encryption Set created by the Databricks Workspace. |
<!-- END_TF_DOCS -->