<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.syn_ws_sa_role_si_c](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.syn_ws_sa_role_si_sbdc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_synapse_firewall_rule.allow_my_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_firewall_rule) | resource |
| [azurerm_synapse_role_assignment.syn_ws_role_default_user](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_role_assignment) | resource |
| [azurerm_synapse_workspace.adl_syn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace) | resource |
| [azurerm_synapse_workspace_aad_admin.syn_aad_login](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace_aad_admin) | resource |
| [time_sleep.wait_40_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [http_http.ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this resource. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | `""` | no |
| <a name="input_adls_id"></a> [adls\_id](#input\_adls\_id) | The ID of the adls associated with the syn workspace. | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The ID of the storage account associated with the syn workspace. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the storage account associated with the syn workspace. | `string` | n/a | yes |
| <a name="input_synadmin_username"></a> [synadmin\_username](#input\_synadmin\_username) | The Login Name of the SQL administrator. | `string` | n/a | yes |
| <a name="input_synadmin_password"></a> [synadmin\_password](#input\_synadmin\_password) | The Password associated with the sql\_administrator\_login for the SQL administrator. | `string` | n/a | yes |
| <a name="input_set_aad_login"></a> [set\_aad\_login](#input\_set\_aad\_login) | n/a | `bool` | `false` | no |
| <a name="input_aad_login"></a> [aad\_login](#input\_aad\_login) | AAD login. | <pre>object({<br>    name      = string<br>    object_id = string<br>    tenant_id = string<br>  })</pre> | <pre>{<br>  "name": "AzureAD Admin",<br>  "object_id": "00000000-0000-0000-0000-000000000000",<br>  "tenant_id": "00000000-0000-0000-0000-000000000000"<br>}</pre> | no |
| <a name="input_private_dns_zone_ids_sql"></a> [private\_dns\_zone\_ids\_sql](#input\_private\_dns\_zone\_ids\_sql) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_private_dns_zone_ids_dev"></a> [private\_dns\_zone\_ids\_dev](#input\_private\_dns\_zone\_ids\_dev) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_managed_virtual_network_enabled"></a> [managed\_virtual\_network\_enabled](#input\_managed\_virtual\_network\_enabled) | Is Virtual Network enabled for all computes in this workspace? Changing this forces a new resource to be created. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Synapse workspace. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Synapse workspace. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Synapse workspace exists. |
<!-- END_TF_DOCS -->