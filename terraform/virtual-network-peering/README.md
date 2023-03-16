<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.adl_peer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network. | `string` | n/a | yes |
| <a name="input_remote_virtual_network_id"></a> [remote\_virtual\_network\_id](#input\_remote\_virtual\_network\_id) | The full Azure resource ID of the remote virtual network. | `string` | n/a | yes |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controls if the VMs in the remote virtual network can access VMs in the local virtual network. | `bool` | `true` | no |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controls if forwarded traffic from VMs in the remote virtual network is allowed. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controls if remote gateways can be used on the local virtual network. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Virtual Network Peering. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Virtual Network Peering. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Virtual Network Peering exists. |
<!-- END_TF_DOCS -->