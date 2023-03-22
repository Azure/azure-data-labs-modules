<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.st_role_admin_c](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.st_role_admin_sbdc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.adl_st](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.firewall_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_storage_data_lake_gen2_filesystem.st_adls](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_data_lake_gen2_filesystem) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [http_http.ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the Resource Group. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | `""` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Defines the Tier to use for this storage account. | `string` | `"Standard"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Defines the type of replication to use for this storage account. | `string` | `"LRS"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | Defines the Kind of account. | `string` | `"StorageV2"` | no |
| <a name="input_hns_enabled"></a> [hns\_enabled](#input\_hns\_enabled) | Hierarchical namespaces enabled/disabled. | `bool` | `true` | no |
| <a name="input_firewall_virtual_network_subnet_ids"></a> [firewall\_virtual\_network\_subnet\_ids](#input\_firewall\_virtual\_network\_subnet\_ids) | A list of virtual network subnet ids to to secure the storage account. | `list(string)` | `[]` | no |
| <a name="input_firewall_default_action"></a> [firewall\_default\_action](#input\_firewall\_default\_action) | Specifies the default action of allow or deny when no other rules match. | `string` | `"Deny"` | no |
| <a name="input_firewall_ip_rules"></a> [firewall\_ip\_rules](#input\_firewall\_ip\_rules) | List of public IP or IP ranges in CIDR Format. | `list(string)` | `[]` | no |
| <a name="input_firewall_bypass"></a> [firewall\_bypass](#input\_firewall\_bypass) | Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. | `list(string)` | <pre>[<br>  "AzureServices"<br>]</pre> | no |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum supported TLS version for the storage account. | `string` | `"TLS1_2"` | no |
| <a name="input_private_dns_zone_ids_blob"></a> [private\_dns\_zone\_ids\_blob](#input\_private\_dns\_zone\_ids\_blob) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_private_dns_zone_ids_file"></a> [private\_dns\_zone\_ids\_file](#input\_private\_dns\_zone\_ids\_file) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_private_dns_zone_ids_dfs"></a> [private\_dns\_zone\_ids\_dfs](#input\_private\_dns\_zone\_ids\_dfs) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this resource. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Storage Account. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Storage Account. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Storage Account exists. |
| <a name="output_access_key"></a> [access\_key](#output\_access\_key) | Primary access keyfor the Storage Account. |
| <a name="output_adls_id"></a> [adls\_id](#output\_adls\_id) | Resource identifier of the ADLS filesystem. |
<!-- END_TF_DOCS -->