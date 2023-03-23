<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory_integration_runtime_self_hosted.adl_adf_shir](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_integration_runtime_self_hosted) | resource |
| [azurerm_storage_blob.powershell_script_blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [azurerm_storage_container.scripts_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_virtual_machine_extension.adl_adf_shir_vm_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | The ID of the virtual network to which the private DNS zones will be linked to. | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | `""` | no |
| <a name="input_data_factory_id"></a> [data\_factory\_id](#input\_data\_factory\_id) | The name of the data factory. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the storage account needed for configuration. | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | The key of the storage account needed for configuration. | `string` | n/a | yes |
| <a name="input_virtual_machine_user"></a> [virtual\_machine\_user](#input\_virtual\_machine\_user) | The user for the virtual machine. | `string` | `"azureuser"` | no |
| <a name="input_virtual_machine_password"></a> [virtual\_machine\_password](#input\_virtual\_machine\_password) | The password of the virtual machine. | `string` | `"ThisIsNotVerySecure!"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Self Hosted Integration Runtime. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Self Hosted Integration Runtime. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Self Hosted Integration Runtime exists. |
| <a name="output_primary_authorization_key"></a> [primary\_authorization\_key](#output\_primary\_authorization\_key) | Primary authorization key of the Self Hosted Integration Runtime. |
<!-- END_TF_DOCS -->