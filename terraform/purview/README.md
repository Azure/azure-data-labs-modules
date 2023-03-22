<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_purview_account.adl_pview](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/purview_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | `""` | no |
| <a name="input_public_network_enabled"></a> [public\_network\_enabled](#input\_public\_network\_enabled) | Should the Purview Account be visible to the public network? | `bool` | `false` | no |
| <a name="input_private_dns_zone_ids_account"></a> [private\_dns\_zone\_ids\_account](#input\_private\_dns\_zone\_ids\_account) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_private_dns_zone_ids_portal"></a> [private\_dns\_zone\_ids\_portal](#input\_private\_dns\_zone\_ids\_portal) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Purview. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Purview. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Purview exists. |
<!-- END_TF_DOCS -->