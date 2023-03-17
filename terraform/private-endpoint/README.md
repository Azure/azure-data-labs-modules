<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.adl_pe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | (Required) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private\_connection\_resource\_id or private\_connection\_resource\_alias must be specified. Changing this forces a new resource to be created. For a web app or function app slot, the parent web app should be used in this field instead of a reference to the slot itself. | `string` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | (Optional) A list of subresource names which the Private Endpoint is able to connect to. subresource\_names corresponds to group\_id. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | (Optional) Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created | `bool` | `false` | no |
| <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids) | (Required) Specifies the list of Private DNS Zones to include within the private\_dns\_zone\_group. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Private Endpoint. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Private Endpoint. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Private Endpoint. |
<!-- END_TF_DOCS -->