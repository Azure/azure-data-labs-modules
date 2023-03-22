<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_dev_test_global_vm_shutdown_schedule.vm_schedule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule) | resource |
| [azurerm_network_interface.vm_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.vm_nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.vm_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.vm_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_machine.adl_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_jumphost_username"></a> [jumphost\_username](#input\_jumphost\_username) | VM username. | `string` | n/a | yes |
| <a name="input_jumphost_password"></a> [jumphost\_password](#input\_jumphost\_password) | VM password. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for the virtual machine. | `string` | n/a | yes |
| <a name="input_storage_image_reference"></a> [storage\_image\_reference](#input\_storage\_image\_reference) | Storage image reference. | <pre>object({<br>    publisher = string<br>    offer     = string<br>    sku       = string<br>    version   = string<br>  })</pre> | <pre>{<br>  "offer": "dsvm-win-2019",<br>  "publisher": "microsoft-dsvm",<br>  "sku": "server-2019",<br>  "version": "latest"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Virtual Machine. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Virtual Machine. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Virtual Machine exists. |
| <a name="output_identity"></a> [identity](#output\_identity) | "<br>      principal\_id - The Principal ID associated with this Managed Service Identity.<br>      tenant\_id - The Tenant ID associated with this Managed Service Identity.<br>  " |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | Public IP address assigned to the Virtual Machine. |
<!-- END_TF_DOCS -->