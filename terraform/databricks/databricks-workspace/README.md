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
| <a name="input_public_subnet_network_security_group_association_id"></a> [public\_subnet\_network\_security\_group\_association\_id](#input\_public\_subnet\_network\_security\_group\_association\_id) | The resource ID of the azurerm\_subnet\_network\_security\_group\_association resource which is referred to by the public\_subnet\_name field. | `string` | `null` | no |
| <a name="input_private_subnet_network_security_group_association_id"></a> [private\_subnet\_network\_security\_group\_association\_id](#input\_private\_subnet\_network\_security\_group\_association\_id) | The resource ID of the azurerm\_subnet\_network\_security\_group\_association resource which is referred to by the private\_subnet\_name field. | `string` | `null` | no |
| <a name="input_no_public_ip"></a> [no\_public\_ip](#input\_no\_public\_ip) | Are public IP Addresses not allowed? | `bool` | `true` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Should the Databricks Workspace be accesible through the public network? | `bool` | `false` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_private_link_deployment_type"></a> [private\_link\_deployment\_type](#input\_private\_link\_deployment\_type) | Type of configuration for Private Link. In Standard configuration, there are separate private endpoints for frontend and backend. | `string` | `"simplified"` | no |
| <a name="input_frontend_private_dns_zone_ids"></a> [frontend\_private\_dns\_zone\_ids](#input\_frontend\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include for the frontend. Must be provided when private\_link\_deployment\_type is standard | `list(string)` | `[]` | no |
| <a name="input_backend_private_dns_zone_ids"></a> [backend\_private\_dns\_zone\_ids](#input\_backend\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include for the backend. Must be provided when is\_private\_endpoint is true | `list(string)` | `[]` | no |
| <a name="input_frontend_subnet_id"></a> [frontend\_subnet\_id](#input\_frontend\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for the user access Private Endpoints. Must be provided when private\_link\_deployment\_type is standard | `string` | `null` | no |
| <a name="input_backend_subnet_id"></a> [backend\_subnet\_id](#input\_backend\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for the backend Private Endpoint. Must be provided when is\_private\_endpoint is true | `string` | `null` | no |
| <a name="input_private_web_auth_workspace"></a> [private\_web\_auth\_workspace](#input\_private\_web\_auth\_workspace) | Azure Databricks Workspace Instance Resource identifier for Private Endpoint Web Authentication. Defaults to the created workspace if not provided | `string` | `null` | no |
| <a name="input_enable_ip_access_list"></a> [enable\_ip\_access\_list](#input\_enable\_ip\_access\_list) | Enable IP access lists. | `bool` | `false` | no |
| <a name="input_allow_ip_list"></a> [allow\_ip\_list](#input\_allow\_ip\_list) | Specifies the list of IPs allowed to the workspace. | `list(string)` | `[]` | no |
| <a name="input_block_ip_list"></a> [block\_ip\_list](#input\_block\_ip\_list) | Specifies the list of IPs blocked to the workspace. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Azure Databricks. |
| <a name="output_workspace_url"></a> [workspace\_url](#output\_workspace\_url) | The URL used to connect to the workspace of the Azure Databricks. |
| <a name="output_name"></a> [name](#output\_name) | The name of the instance of Azure Databricks. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the instance of Azure Databricks exists. |
<!-- END_TF_DOCS -->