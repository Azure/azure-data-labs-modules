<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.adl_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | `"North Europe"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the Resource Group. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Resource Group. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Resource Group. |
| <a name="output_location"></a> [location](#output\_location) | Location assigned to the Resource Group. |
<!-- END_TF_DOCS -->