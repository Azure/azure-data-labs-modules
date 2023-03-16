<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_route.adl_r](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Route. | `string` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | The name of the route table within which create the route. | `string` | n/a | yes |
| <a name="input_address_prefix"></a> [address\_prefix](#input\_address\_prefix) | The destination to which the route applies. | `string` | n/a | yes |
| <a name="input_next_hop_type"></a> [next\_hop\_type](#input\_next\_hop\_type) | The type of Azure hop the packet should be sent to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of network route. |
| <a name="output_name"></a> [name](#output\_name) | The name of the network route. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the network route exists. |
<!-- END_TF_DOCS -->