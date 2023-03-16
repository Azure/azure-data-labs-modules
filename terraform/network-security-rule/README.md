<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_rule.adl_nsgsr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the security rule. | `string` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the priority of the rule. | `number` | n/a | yes |
| <a name="input_direction"></a> [direction](#input\_direction) | The direction specifies if rule will be evaluated on incoming or outgoing traffic. | `string` | n/a | yes |
| <a name="input_access"></a> [access](#input\_access) | Specifies whether network traffic is allowed or denied. | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Network protocol this rule applies to. | `string` | n/a | yes |
| <a name="input_source_port_range"></a> [source\_port\_range](#input\_source\_port\_range) | List of source ports or port ranges. | `string` | n/a | yes |
| <a name="input_destination_port_range"></a> [destination\_port\_range](#input\_destination\_port\_range) | List of destination ports or port ranges. | `string` | `"Destination Port or Range"` | no |
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | CIDR or destination IP range or * to match any IP. | `string` | n/a | yes |
| <a name="input_destination_address_prefix"></a> [destination\_address\_prefix](#input\_destination\_address\_prefix) | List of destination address prefixes. | `string` | n/a | yes |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | The name of the Network Security Group that we want to attach the rule to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Network Security rule. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Network Security rule. |
<!-- END_TF_DOCS -->