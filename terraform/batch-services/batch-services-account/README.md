<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_batch_account.adl_batch_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/batch_account) | resource |
| [azurerm_private_endpoint.batchacc_pe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | `""` | no |
| <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_pool_allocation_mode"></a> [pool\_allocation\_mode](#input\_pool\_allocation\_mode) | Specifies the mode to use for pool allocation. | `string` | `"BatchService"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for the Batch Services Account. | `bool` | `false` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Storage account ID for the Batch Service. | `string` | n/a | yes |
| <a name="input_allowed_authentication_modes"></a> [allowed\_authentication\_modes](#input\_allowed\_authentication\_modes) | Specifies the allowed authentication modes for the Batch account. | `list(string)` | <pre>[<br>  "AAD",<br>  "SharedKey",<br>  "TaskAuthenticationToken"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Batch Services Account. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Batch Services Account. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Batch Services Account exists. |
<!-- END_TF_DOCS -->